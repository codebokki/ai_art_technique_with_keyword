import 'package:ai_art_technique_with_keyword/d_view/a_splash/a_scaffold/splash_scaffold.dart';
import 'package:ai_art_technique_with_keyword/d_view/b_home/a_scaffold/home_scaffold.dart';
import 'package:flutter/material.dart';

class RouteData {
  static const String _root = '/';
  static const String _splash = '/splash';
  static const String _home = '/home';
  static const String _error = '/error';

  static String get root => _root;
  static String get splash => _splash;
  static String get home => _home;
  static String get error => _error;

  static final Map<String, String> routes = {
    'splash': splash,
    'home': home,
    'error': error,
  };

  static final Map<String, Widget Function(BuildContext context)> list = {
    splash: (context) => const SplashScaffold(),
    home: (context) => const HomeScaffold(),
    error: (context) => const Scaffold(),
  };
}
