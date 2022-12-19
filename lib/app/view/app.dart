import 'package:flutter/material.dart';
import 'package:my_add/l10n/l10n.dart';
import 'package:my_add/login/view/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF0BDA51)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF0BDA51),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home:  Login()
    ,);
  }
}
