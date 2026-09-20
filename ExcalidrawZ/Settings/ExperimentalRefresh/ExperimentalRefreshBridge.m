#import "ExperimentalRefreshBridge.h"
#import <TargetConditionals.h>
#if TARGET_OS_OSX && !defined(APP_STORE)
// WebKit SPI, intentionally absent from App Store and iOS compilation.
@interface WKPreferences (ExperimentalRefresh)
+ (NSArray *)_features;
- (void)_setEnabled:(BOOL)enabled forFeature:(id)feature;
- (BOOL)_isEnabledForFeature:(id)feature;
@end
@interface NSObject (ExperimentalRefreshFeature)
- (NSString *)key;
@end

static BOOL HasSignature(id receiver, SEL selector, const char *result, NSArray<NSString *> *arguments) {
    NSMethodSignature *signature = [receiver methodSignatureForSelector:selector];
    if (!signature || strcmp(signature.methodReturnType, result) || signature.numberOfArguments != arguments.count + 2) return NO;
    for (NSUInteger i = 0; i < arguments.count; i++)
        if (strcmp([signature getArgumentTypeAtIndex:i + 2], arguments[i].UTF8String)) return NO;
    return YES;
}

static id RefreshFeature(void) {
    if (!HasSignature(WKPreferences.class, @selector(_features), @encode(id), @[])) return nil;
    NSArray *features = [WKPreferences _features];
    if (![features isKindOfClass:NSArray.class]) return nil;
    for (id feature in features) {
        if (HasSignature(feature, @selector(key), @encode(id), @[]) &&
            [[feature key] isKindOfClass:NSString.class] &&
            [[feature key] isEqualToString:@"PreferPageRenderingUpdatesNear60FPSEnabled"]) return feature;
    }
    return nil;
}
static BOOL SupportsAccess(WKPreferences *preferences) {
    return HasSignature(preferences, @selector(_setEnabled:forFeature:), @encode(void), @[@(@encode(BOOL)), @(@encode(id))]) &&
        HasSignature(preferences, @selector(_isEnabledForFeature:), @encode(BOOL), @[@(@encode(id))]);
}
#endif

BOOL EXRefreshPreferenceAvailable(void) {
#if TARGET_OS_OSX && !defined(APP_STORE)
    @try { return RefreshFeature() != nil && SupportsAccess([WKPreferences new]); }
    @catch (NSException *exception) { return NO; }
#else
    return NO;
#endif
}

BOOL EXSetPreferNear60FPS(WKPreferences *preferences, BOOL preferNear60) {
#if TARGET_OS_OSX && !defined(APP_STORE)
    @try {
        id feature = RefreshFeature();
        if (!feature || !SupportsAccess(preferences)) return NO;
        [preferences _setEnabled:preferNear60 forFeature:feature];
        return [preferences _isEnabledForFeature:feature] == preferNear60;
    } @catch (NSException *exception) { return NO; }
#else
    return NO;
#endif
}
