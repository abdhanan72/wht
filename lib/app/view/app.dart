import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_add/l10n/l10n.dart';
import 'package:my_add/login/view/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      textTheme: GoogleFonts.yeonSungTextTheme(),
        
        appBarTheme: const AppBarTheme(color: Color(0xFFF50514)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFF50514),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home:  Login()
    ,);
  }
}
