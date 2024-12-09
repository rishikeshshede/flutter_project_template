import 'package:flutter/material.dart';
import 'package:flutter_project_template/utils/log_handler_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  LogHandlerUtil.isProduction =
      dotenv.env['IS_PRODUCTION']?.toLowerCase() == 'true';
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
