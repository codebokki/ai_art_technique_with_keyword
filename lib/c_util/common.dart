import 'package:ai_art_technique_with_keyword/b_data/c_route/route_data.dart';
import 'package:flutter/material.dart';

class Common {
  static void changeScaffold(BuildContext context, {required String scaffold}) {
    String? routeString = RouteData.routes[scaffold];

    // NO ROUTE, THEN GO TO ERROR SCAFFOLD.
    if (routeString == null) {
      routeString = RouteData.routes['error']!;
      Navigator.pushNamed(context, routeString);
      return;
    }

    Navigator.pushNamedAndRemoveUntil(context, routeString, (route) => false);
  }
}
