import 'terminal_actions_platform_interface.dart';

class TerminalActions {
  Future<String?> getPlatformVersion() {
    return TerminalActionsPlatform.instance.getPlatformVersion();
  }

  static Future<bool> initialization() {
    return TerminalActionsPlatform.instance.initialization();
  }
}
