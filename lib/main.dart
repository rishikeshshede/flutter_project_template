import 'package:flutter/material.dart';
import 'package:flutter_project_template/utils/log_handler_util.dart';

void main() {
  LogHandlerUtil.isProduction = false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
