import 'terminal_actions_platform_interface.dart';

class TerminalActions {
  Future<bool> initialization() {
    return TerminalActionsPlatform.instance.initialization();
  }

  Future<String?> scan() {
    return TerminalActionsPlatform.instance.scan();
  }
}
