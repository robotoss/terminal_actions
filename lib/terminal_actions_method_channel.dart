import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:terminal_actions/terminal_actions.dart';

import 'terminal_actions_platform_interface.dart';

/// An implementation of [TerminalActionsPlatform] that uses method channels.
class MethodChannelTerminalActions extends TerminalActionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('terminal_actions');

  @override
  Future<bool> initialization() async {
    try {
      if (Platform.isAndroid) {
        await methodChannel.invokeMethod<String>('init');
        return true;
      }
      return false;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<String?> scan() async {
    final scanValue = await methodChannel.invokeMethod<String>('scan');
    return scanValue;
  }

  @override
  Future<bool?> printText({
    required String textToPrint,
    required PrintTextAlign textAlign,
  }) async {
    final value = await methodChannel.invokeMethod<bool>(
      'printText',
      {
        "textToPrint": textToPrint,
        "textAlign": textAlign.value,
      },
    );
    return value;
  }
}
