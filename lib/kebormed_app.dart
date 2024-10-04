import 'package:flutter/material.dart';
import 'features/login/pages/login.dart';

class KebormedApp extends StatefulWidget {
  const KebormedApp({
    super.key,
  });

  @override
  State<KebormedApp> createState() => _KebormedAppState();
}

class _KebormedAppState extends State<KebormedApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kebormed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      localizationsDelegates: const [],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      home: const LoginScreen(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
