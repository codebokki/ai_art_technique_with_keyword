import 'package:ai_art_technique_with_keyword/b_data/a_theme/theme_data.dart';
import 'package:ai_art_technique_with_keyword/b_data/c_route/route_data.dart';
import 'package:flutter/material.dart';

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData,
      routes: RouteData.list,
      initialRoute: RouteData.splash,
    );
  }
}
