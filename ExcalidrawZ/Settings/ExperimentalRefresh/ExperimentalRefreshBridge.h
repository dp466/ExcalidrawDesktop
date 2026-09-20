#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN
/// Only implemented for direct-distribution macOS builds; App Store builds return NO.
BOOL EXRefreshPreferenceAvailable(void);
BOOL EXSetPreferNear60FPS(WKPreferences *preferences, BOOL preferNear60);
NS_ASSUME_NONNULL_END
