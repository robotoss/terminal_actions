#import "TerminalActionsPlugin.h"
#if __has_include(<terminal_actions/terminal_actions-Swift.h>)
#import <terminal_actions/terminal_actions-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "terminal_actions-Swift.h"
#endif

@implementation TerminalActionsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTerminalActionsPlugin registerWithRegistrar:registrar];
}
@end
