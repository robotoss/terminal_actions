import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:terminal_actions/terminal_actions.dart';

import 'terminal_actions_method_channel.dart';

abstract class TerminalActionsPlatform extends PlatformInterface {
  /// Constructs a TerminalActionsPlatform.
  TerminalActionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static TerminalActionsPlatform _instance = MethodChannelTerminalActions();

  /// The default instance of [TerminalActionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelTerminalActions].
  static TerminalActionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TerminalActionsPlatform] when
  /// they register themselves.
  static set instance(TerminalActionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> initialization() {
    throw UnimplementedError('initialization() has not been implemented.');
  }

  Future<String?> scan() {
    throw UnimplementedError('scan() has not been implemented.');
  }

  Future<bool?> printText({
    required String textToPrint,
    required PrintTextAlign textAlign,
  }) {
    throw UnimplementedError('printText() has not been implemented.');
  }
}
