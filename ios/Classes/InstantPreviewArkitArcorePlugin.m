#import "InstantPreviewArkitArcorePlugin.h"
#if __has_include(<instant_preview_arkit_arcore/instant_preview_arkit_arcore-Swift.h>)
#import <instant_preview_arkit_arcore/instant_preview_arkit_arcore-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "instant_preview_arkit_arcore-Swift.h"
#endif

@implementation InstantPreviewArkitArcorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInstantPreviewArkitArcorePlugin registerWithRegistrar:registrar];
}
@end
