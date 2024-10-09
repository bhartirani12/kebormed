import 'package:flutter/material.dart';
import 'package:kebormed/core/utils/app_storage.dart';
import 'package:kebormed/kebormed_app.dart';

import 'injection/injection_conatiner.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await AppStorage.initializePrefs();
  runApp(
    const KebormedApp(),
  );
}
