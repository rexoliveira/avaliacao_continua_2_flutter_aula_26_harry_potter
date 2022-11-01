import 'package:flutter/material.dart';

import '../src/herry_potter/harry_potter_page.dart';
import 'consts_routes.dart';

class Routes {
  Routes._();
  static Map<String, Widget Function(BuildContext)> routes = {
    ConstsRoutes.source: (contex) => const MyHomePage()
  };
}
