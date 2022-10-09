import 'package:flutter_test/flutter_test.dart';
import 'package:terminal_actions/terminal_actions.dart';
import 'package:terminal_actions/terminal_actions_platform_interface.dart';
import 'package:terminal_actions/terminal_actions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTerminalActionsPlatform
    with MockPlatformInterfaceMixin
    implements TerminalActionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TerminalActionsPlatform initialPlatform = TerminalActionsPlatform.instance;

  test('$MethodChannelTerminalActions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTerminalActions>());
  });

  test('getPlatformVersion', () async {
    TerminalActions terminalActionsPlugin = TerminalActions();
    MockTerminalActionsPlatform fakePlatform = MockTerminalActionsPlatform();
    TerminalActionsPlatform.instance = fakePlatform;

    expect(await terminalActionsPlugin.getPlatformVersion(), '42');
  });
}
