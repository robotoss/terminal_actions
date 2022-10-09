import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'terminal_actions_platform_interface.dart';

/// An implementation of [TerminalActionsPlatform] that uses method channels.
class MethodChannelTerminalActions extends TerminalActionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('terminal_actions');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
