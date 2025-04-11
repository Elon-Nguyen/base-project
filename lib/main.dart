import 'package:base_project/app.dart';
import 'package:base_project/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  const environment = String.fromEnvironment('ENV', defaultValue: 'dev');
  await dotenv.load(fileName: '.env.$environment');

  initApp();

  runApp(const App());
}
