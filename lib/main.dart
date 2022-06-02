import 'package:aaa_hiring/decoration/my_colors.dart';
import 'package:aaa_hiring/screens/football_clubs_screen.dart';
import 'package:aaa_hiring/services/languages_service.dart';
import 'package:aaa_hiring/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //runApp(const MyApp());
  runApp(
    EasyLocalization(
        supportedLocales: LanguageService.supportedLanguages.map((lang) => Locale(lang)).toList(),
        path: 'assets/translations',
        fallbackLocale: const Locale(LanguageService.defaultLanguage),
        child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        // context.setLocale(Locale(LanguageService.getLang(ui.window.locale.languageCode))); TODO Remove me
      },
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'AAA Hiring',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        home: const FootballClubsScreen(),
      ),
    );
  }
}