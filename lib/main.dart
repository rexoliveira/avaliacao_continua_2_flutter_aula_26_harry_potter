import 'package:breaking_bad_api/routes/consts_routes.dart';
import 'package:breaking_bad_api/utils/custom_theme_data.dart';
import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'utils/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ConstsRoutes.source,
      routes: Routes.routes,
      title: Consts.titleMain,
      theme: CustomThemeData.themeData,
    );
  }
}
