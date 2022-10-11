import 'terminal_actions_platform_interface.dart';

class TerminalActions {
  Future<bool> initialization() {
    return TerminalActionsPlatform.instance.initialization();
  }

  Future<String?> scan() {
    return TerminalActionsPlatform.instance.scan();
  }

  Future<bool?> printText({
    required String textToPrint,
    PrintTextAlign textAlign = PrintTextAlign.left,
  }) {
    return TerminalActionsPlatform.instance.printText(
      textToPrint: textToPrint,
      textAlign: textAlign,
    );
  }
}

enum PrintTextAlign {
  left(0),
  center(1),
  right(2);

  const PrintTextAlign(this.value);
  final int value;
}
