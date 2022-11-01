import 'package:breaking_bad_api/src/herry_potter/harry_potter_page.dart';
import 'package:breaking_bad_api/utils/custom_theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (contex) => const MyHomePage()},
      title: '',
      theme: CustomThemeData.themeData,
    );
  }
}
