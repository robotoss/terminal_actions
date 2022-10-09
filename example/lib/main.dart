import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terminal_actions/terminal_actions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? scanValue;
  final terminal = TerminalActions();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: FutureBuilder(
          future: terminal.initialization(),
          builder: (context, snapshot) {
            return Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Scan data:\n',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: scanValue ?? 'data is null',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.document_scanner),
        ),
      ),
    );
  }
}
