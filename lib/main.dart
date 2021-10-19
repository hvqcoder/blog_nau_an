import 'package:flutter/material.dart';
import 'package:pilot_app/Helper/custom_theme.dart';
import 'package:pilot_app/Views/Screen/SplashScreen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: CustomTheme.lightMode,
      darkTheme: CustomTheme.darkMode,
      home: const SplashScreen(),
    );
  }
}
