import 'package:ai_art_technique_with_keyword/c_util/common.dart';
import 'package:ai_art_technique_with_keyword/d_view/a_splash/b_body/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScaffold extends StatelessWidget {
  const SplashScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    showSplash(context);

    return const Scaffold(
      body: SplashBody(),
    );
  }

  void showSplash(BuildContext context) async {
    await Future.delayed(
      const Duration(milliseconds: 1800),
    ).then((_) {
      Common.changeScaffold(
        context,
        scaffold: 'home',
      );
    });
  }
}
