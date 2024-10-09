import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routes/route.dart';
import 'features/home/pages/home.dart';
import 'features/login/pages/login.dart';
import 'injection/injection_conatiner.dart';
import 'resources/resource.dart';

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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
      initialRoute: di<Routes>().login,
      routes: {
        di<Routes>().login: (context) => const LoginScreen(),
        di<Routes>().home: (context) => const HomeScreen(),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
