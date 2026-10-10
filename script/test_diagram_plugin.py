#!/usr/bin/env python3
"""Behavioral checks for portable network diagrams and plugin distribution."""
import copy
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile
import shutil

ROOT = Path(__file__).resolve().parent.parent
NETWORK = ROOT / 'plugins/excalidraw-design/skills/excalidraw-network'
sys.path.insert(0, str(NETWORK / 'scripts'))
from network_document import Compiler, audit, merge_scene_pages, route_audit, shared_segment_length, validate
from icon_elements import KINDS, component
sys.path.insert(0, str(ROOT / 'script'))
from package_diagram_plugin import build
import package_diagram_plugin
ELECTRICAL = ROOT / 'plugins/excalidraw-design/skills/excalidraw-electrical'
sys.path.insert(0, str(ELECTRICAL / 'scripts'))
import wiring_document
import equipment_elements


class ElectricalDiagramTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.spec = json.loads((ELECTRICAL / 'assets/fictional-wiring.json').read_text())

    def invalid(self, change, message):
        spec = copy.deepcopy(self.spec); change(spec)
        r = wiring_document.validate(spec)
        self.assertFalse(r['ok'])
        self.assertTrue(any(message in e for e in r['errors']), r)

    def test_documentation_fixture_preserves_unknown_ratings(self):
        report = wiring_document.validate(self.spec)
        self.assertTrue(report['ok'], report)
        self.assertEqual(len(report['unknowns']), 8)
        self.assertIn('disconnected', self.spec['status'])

    def test_unknown_terminal_is_rejected(self):
        self.invalid(lambda s: s['wires'][0]['destination'].update(terminal='NO-SUCH-STUD'), 'unknown destination terminal')

    def test_dc_return_cannot_be_silently_aliased_to_earth(self):
        self.invalid(lambda s: s['wires'][1].update(kind='protective_earth', domain='PE'), 'endpoint conductor kind/domain mismatch')

    def test_cross_voltage_wire_is_rejected(self):
        self.invalid(lambda s: s['devices'][1]['terminals']['IN'].update(domain='DC12'), 'endpoint conductor kind/domain mismatch')

    def test_shared_connector_does_not_establish_protocol_compatibility(self):
        self.invalid(lambda s: s['devices'][4]['terminals']['VE.Direct1'].update(protocol='Ethernet'), 'protocol mismatch')

    def test_independent_can_buses_cannot_share_a_wire(self):
        self.invalid(lambda s: s['devices'][4]['terminals']['VE.Direct1'].update(bus='OTHER-BUS'), 'communication bus mismatch')

    def test_same_net_cannot_mix_positive_and_return(self):
        self.invalid(lambda s: s['wires'][1].update(net=s['wires'][0]['net']), 'common net mixes')

    def test_coordinates_do_not_accept_booleans_or_nonfinite_values(self):
        for value in (True, float('inf')):
            self.invalid(lambda s: s['devices'][0]['terminals']['+'].update(x=value), 'finite drawing coordinates')

    def test_every_illustration_retains_editable_terminals_and_metadata(self):
        for kind in equipment_elements.KINDS:
            d = copy.deepcopy(self.spec['devices'][0]); d['kind'] = kind
            es = equipment_elements.component(d)
            byid = {e['id']: e for e in es}
            self.assertEqual(byid[d['id']]['customData']['electrical_device'], d)
            self.assertEqual(byid[d['id']+'-terminal-+']['customData']['electrical_terminal']['kind'], 'dc_positive')
            self.assertTrue(all(e['groupIds']==[d['id']+'-group'] for e in es))
            self.assertTrue(all(e['fontFamily']==5 for e in es if e['type']=='text'))

    def scene(self):
        es = [e for d in self.spec['devices'] for e in equipment_elements.component(d)]
        for w in self.spec['wires']:
            es.append({'id':w['id'], 'type':'arrow', 'startArrowhead':None, 'endArrowhead':None,
                'startBinding':{'elementId':w['source']['device']+'-terminal-'+w['source']['terminal']},
                'endBinding':{'elementId':w['destination']['device']+'-terminal-'+w['destination']['terminal']},
                'customData':{'electrical_wire':w}})
            es.append({'id':w['id']+'-label', 'type':'text', 'fontFamily':5, 'text':wiring_document.wire_label(w)})
        return {'elements':es, 'revision':'test:1', 'total':len(es)}

    def test_audit_requires_terminal_bindings_and_visible_endpoints(self):
        scene=self.scene()
        self.assertTrue(wiring_document.audit(self.spec,scene)['ok'])
        next(e for e in scene['elements'] if e['id']=='W001')['endBinding']=None
        self.assertTrue(any('destination terminal binding' in e for e in wiring_document.audit(self.spec,scene)['errors']))
        scene=self.scene();next(e for e in scene['elements'] if e['id']=='W001-label')['text']='W001 red wire'
        self.assertFalse(wiring_document.audit(self.spec,scene)['ok'])

    def test_partial_or_changed_revision_read_cannot_pass_audit(self):
        scene=self.scene()
        with self.assertRaisesRegex(ValueError,'incomplete'):
            wiring_document.merge_pages({**scene,'elements':scene['elements'][:2]})
        with self.assertRaisesRegex(ValueError,'changed'):
            wiring_document.merge_pages([scene,{**scene,'revision':'test:2'}])

    def test_editor_line_wrapping_preserves_visible_model_and_wire_facts(self):
        scene=self.scene()
        for e in scene['elements']:
            if e['id'] in ('FUSE-01-caption','W001-label'):
                e['text']=e['text'].replace(' ','\n')
        self.assertTrue(wiring_document.audit(self.spec,scene)['ok'])

    def test_wire_csv_preserves_both_terminals_and_unknowns(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'wires.csv';wiring_document.schedule(self.spec,p)
            import csv
            with p.open() as f:
                rows=list(csv.DictReader(f))
            self.assertEqual(rows[0]['Source terminal'],'BAT-01/+')
            self.assertEqual(rows[0]['Destination terminal'],'FUSE-01/IN')
            self.assertEqual(rows[0]['Gauge'],'TBD (unverified)')


class NetworkDiagramTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.spec = json.loads((NETWORK / 'assets/aurora-network.json').read_text())
        cls.compiled = Compiler(cls.spec).compile()

    def invalid(self, edit, expected):
        spec = copy.deepcopy(self.spec)
        edit(spec)
        report = validate(spec)
        self.assertFalse(report['ok'])
        self.assertTrue(any(expected in e for e in report['errors']), report)

    def test_complete_fixture_and_geometry(self):
        r = self.compiled['report']
        self.assertEqual((r['devices'], r['physical_cables'], r['logical_links'], r['sheets']), (41, 58, 10, 10))
        self.assertEqual(r['label_findings'], [])
        self.assertEqual(r['route_findings'], [])
        scene = {'elements': self.compiled['operations'][1]['elements'], 'revision': 'test:1'}
        self.assertTrue(audit(self.spec, scene)['ok'])

    def test_unknown_port(self):
        self.invalid(lambda s: s['connections'][0]['source'].update(port='imaginary-100G'), 'has no port')

    def test_sheet_numbers_and_operational_text_size(self):
        elements={e['id']:e for e in self.compiled['operations'][1]['elements']}
        for index,sheet in enumerate(self.spec['sheets'],1):
            self.assertTrue(elements[sheet['id']+'-document-control']['text'].endswith(f'{index:02}/10'))
        cells=[e for e in elements.values() if 'network_documentation' in e.get('customData',{})]
        self.assertTrue(cells)
        self.assertTrue(all(e['fontSize']>=48 for e in cells))

    def test_standard_vswitch_has_independent_failover_uplinks(self):
        links = {c['id']: c for c in self.spec['connections']}
        for identifier, role in [('C35', 'active'), ('C36', 'standby'), ('C37', 'active'), ('C38', 'standby')]:
            self.assertIn('vSwitch0 '+role+' independent trunk', links[identifier]['purpose'])
            self.assertIn('no port-channel', links[identifier]['purpose'])
            self.assertIn(role, links[identifier]['vlan_label'])
        for identifier in ('L07', 'L08', 'L09', 'L10'):
            self.assertIn('vSwitch0/PG70', {links[identifier][end]['port'] for end in ('source', 'destination')})

    def test_one_cable_per_physical_port(self):
        self.invalid(lambda s: s['connections'][1].update(source=s['connections'][0]['source']), 'already used')

    def test_incompatible_speed(self):
        self.invalid(lambda s: s['connections'][0].update(speed_mbps=100000), 'does not support')

    def test_incompatible_medium(self):
        self.invalid(lambda s: s['connections'][0].update(medium='Wi-Fi'), 'incompatible medium')

    def test_boolean_is_not_a_speed(self):
        self.invalid(lambda s: s['connections'][0].update(speed_mbps=True), 'explicit speed')

    def test_duplicate_ip(self):
        self.invalid(lambda s: s['devices'][1].update(management_ip=s['devices'][0]['management_ip']), 'Duplicate management IP')

    def test_missing_sheet_connection(self):
        self.invalid(lambda s: s['sheets'][0]['connections'].pop(), 'has no diagram')

    def test_logical_cannot_impersonate_a_cable(self):
        self.invalid(lambda s: s['connections'][0].update(kind='logical'), 'named logical interfaces')

    def test_gateway_outside_prefix(self):
        self.invalid(lambda s: s['networks'][0].update(gateway='192.0.2.200'), 'outside its subnet')

    def test_endpoint_vlan_mismatch(self):
        self.invalid(lambda s: next(c for c in s['connections'] if c['id']=='C49')['destination']['vlan'].update(untagged=99), 'native VLAN mismatch')

    def test_native_vlan_cannot_also_be_tagged(self):
        self.invalid(lambda s: next(c for c in s['connections'] if c['id']=='C51')['source']['vlan']['tagged'].append(10), 'inconsistent tagged/untagged')

    def test_management_url_cannot_embed_password(self):
        self.invalid(lambda s: next(d for d in s['devices'] if d['id']=='br-fw')['details'].update(management_url='https://admin:secret@10.50.10.1'), 'credential-bearing')

    def test_unverified_and_unmanaged_ips_remain_explicit(self):
        for value in ('TBD (unverified)','none (unmanaged)'):
            spec=copy.deepcopy(self.spec);spec['devices'][0]['management_ip']=value
            self.assertTrue(validate(spec)['ok'])

    def test_circuit_gateway_outside_subnet(self):
        self.invalid(lambda s: s['circuits'][0].update(gateway='192.0.2.200'), 'circuit gateway outside prefix')

    def test_invalid_nat_port(self):
        self.invalid(lambda s: s['nat_rules'][0].update(public_port=70000), 'NAT protocol or port')

    def scene(self):
        return {'elements': copy.deepcopy(self.compiled['operations'][1]['elements']), 'revision': 'test:1'}

    def test_scene_audit_rejects_invisible_ports(self):
        scene = self.scene()
        for e in scene['elements']:
            if e['id'] == 'hq-perimeter-C01-ports': e['text'] = 'C01 Ethernet'
        self.assertTrue(any('port is not visible' in e for e in audit(self.spec, scene)['errors']))

    def test_scene_audit_rejects_broken_binding(self):
        scene = self.scene()
        next(e for e in scene['elements'] if e['id']=='hq-perimeter-C01')['endBinding'] = None
        self.assertTrue(any('binding is missing' in e for e in audit(self.spec, scene)['errors']))

    def test_scene_audit_rejects_missing_device_metadata(self):
        scene = self.scene()
        next(e for e in scene['elements'] if e['id']=='hq-perimeter-hq-fw-a')['customData'] = {}
        self.assertFalse(audit(self.spec, scene)['ok'])

    def test_scene_audit_rejects_font_substitution(self):
        scene = self.scene()
        next(e for e in scene['elements'] if e['type']=='text')['fontFamily']=2
        self.assertFalse(audit(self.spec, scene)['ok'])

    def test_scene_audit_rejects_hidden_operational_facts(self):
        for identifier in ('branch-br-ap-01-mac','branch-br-fw-location','branch-operations-ops-2-1-0','edge-operations-ops-1-1-3','branch-document-control'):
            scene=self.scene();next(e for e in scene['elements'] if e['id']==identifier)['text']=''
            self.assertFalse(audit(self.spec,scene)['ok'],identifier)

    def test_pagination_revision_change_and_incomplete_reads(self):
        pages = [{'revision':'r:1','total':2,'elements':[{'id':'a'}]}, {'revision':'r:1','total':2,'elements':[{'id':'b'}]}]
        self.assertEqual(len(merge_scene_pages(pages)['elements']),2)
        pages[1]['revision']='r:2'
        with self.assertRaisesRegex(ValueError,'changed'): merge_scene_pages(pages)
        with self.assertRaisesRegex(ValueError,'missing'): merge_scene_pages(pages[:1])
        pages[1].update(revision='r:1',elements=[{'id':'a'}])
        with self.assertRaisesRegex(ValueError,'repeated'): merge_scene_pages(pages)

    def test_route_audit_distinguishes_crossing_and_shared_line(self):
        self.assertEqual(shared_segment_length((0,10),(100,10),(50,0),(50,20)),0)
        self.assertEqual(shared_segment_length((0,10),(100,10),(50,10),(150,10)),50)
        cables = [{'connection_id':'a','points':[(50,400),(500,400)],'endpoints':{'src','dst'}},
                  {'connection_id':'b','points':[(250,400),(600,400)],'endpoints':{'src','dst'}}]
        issues = route_audit(cables, {'foreign':{'bbox':(300,350,100,100)}}, {'id':'s','width':1000,'height':1000})
        self.assertEqual({i['issue'] for i in issues}, {'route_crosses_device','shared_cable_route'})

    def test_every_equipment_generator_has_an_editable_anchor(self):
        for kind in KINDS:
            elements = component(kind,'test-'+kind)
            anchor = next(e for e in elements if e['id']=='test-'+kind)
            self.assertGreater(anchor['width'],0)
            self.assertTrue(all(e['groupIds']==['test-'+kind+'-group'] for e in elements))


class PluginPackageTests(unittest.TestCase):
    def test_standard_plugin_archive_and_listing_metadata(self):
        with tempfile.TemporaryDirectory(prefix='standard-diagram-plugin-') as directory:
            archive=Path(directory)/'plugin.zip';build(archive,'plugin')
            with zipfile.ZipFile(archive) as z:
                manifest=json.loads(z.read('excalidraw-design/plugin.json'))
                interface=manifest['extensions']['com.openai']['interface']
                self.assertLessEqual(len(interface['shortDescription']),30)
                self.assertEqual({n.split('/')[0] for n in z.namelist()},{manifest['name']})
                self.assertIn('excalidraw-design/.codex-plugin/plugin.json',z.namelist())
                self.assertIn('excalidraw-design/'+interface['logo'].removeprefix('./'),z.namelist())
                self.assertNotIn('excalidraw-design/.app.json',z.namelist())
                self.assertEqual(manifest['author']['name'],'Dilan Paradis')
                self.assertEqual(interface['developerName'],manifest['author']['name'])
                self.assertIn('excalidraw-design/skills/excalidraw-electrical/SKILL.md',z.namelist())
    def test_missing_helper_stops_packaging(self):
        with tempfile.TemporaryDirectory(prefix='diagram-plugin-missing-') as directory:
            source = Path(directory)/'plugin'
            shutil.copytree(ROOT/'plugins/excalidraw-design', source, ignore=shutil.ignore_patterns('__pycache__'))
            (source/'skills/excalidraw-network/scripts/network_document.py').unlink()
            with patch.object(package_diagram_plugin, 'PLUGIN', source):
                with self.assertRaisesRegex(ValueError, 'must be bundled'):
                    build(Path(directory)/'incomplete.zip')

    def test_deterministic_and_relocatable(self):
        with tempfile.TemporaryDirectory(prefix='diagram-plugin-test-') as directory:
            temp = Path(directory)
            one,two = temp/'one.zip',temp/'two.zip'
            self.assertEqual(build(one)['sha256'],build(two)['sha256'])
            with zipfile.ZipFile(one) as archive:
                self.assertIsNone(archive.testzip())
                self.assertFalse(any('/Users/' in archive.read(n).decode() for n in archive.namelist()))
                archive.extractall(temp/'elsewhere')
            package = temp/'elsewhere/excalidraw-diagram-plugin'
            manifest=json.loads((package/'package-manifest.json').read_text())
            import hashlib
            for name,expected in manifest['files_sha256'].items():
                self.assertEqual(hashlib.sha256((package/name).read_bytes()).hexdigest(),expected)
            catalog=json.loads((package/'.agents/plugins/marketplace.json').read_text())
            plugin = package/catalog['plugins'][0]['source']['path']
            self.assertTrue((plugin/'skills/excalidraw-network/SKILL.md').is_file())
            script=plugin/'skills/excalidraw-network/scripts/network_document.py'
            fixture=plugin/'skills/excalidraw-network/assets/aurora-network.json'
            result=subprocess.run([sys.executable,str(script),'compile',str(fixture),'--output',str(temp/'operations.json')],capture_output=True,text=True,check=True,cwd=temp)
            report=json.loads(result.stdout)
            self.assertEqual(report['route_findings'],[])
            self.assertEqual(report['label_findings'],[])
            self.assertEqual(report['physical_cables'],58)
            electrical=plugin/'skills/excalidraw-electrical'
            result=subprocess.run([sys.executable,str(electrical/'scripts/wiring_document.py'),'validate',str(electrical/'assets/fictional-wiring.json')],capture_output=True,text=True,check=True,cwd=temp)
            self.assertTrue(json.loads(result.stdout)['ok'])
            compat=json.loads((package/'.claude-plugin/marketplace.json').read_text())
            self.assertEqual(compat['owner']['name'],'Dilan Paradis')


if __name__=='__main__':unittest.main(verbosity=2)
