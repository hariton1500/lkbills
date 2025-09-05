import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lkbills/Pages/lkbillsmain.dart';

Future<void> main() async {
  await dotenv.load(fileName: "secrets.env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Lkbillsmain(),
    );
  }
}
