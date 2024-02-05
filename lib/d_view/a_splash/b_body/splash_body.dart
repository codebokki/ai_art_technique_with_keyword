import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => SplashBodyState();
}

class SplashBodyState extends State<SplashBody> {
  double aspectRatio = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(
      context,
      child: buildBackground(
        context,
        child: buildBookView(context),
      ),
    );
  }

  Widget buildLayout(
    BuildContext context, {
    required Widget child,
  }) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;

    BoxDecoration layoutDecoration = BoxDecoration(
      color: colorScheme.onBackground,
    );
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: layoutDecoration,
      child: Center(
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: child,
        ),
      ),
    );
  }

  Widget buildBackground(
    BuildContext context, {
    required Widget child,
  }) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;

    BoxDecoration backgroundDecoration = BoxDecoration(
      color: colorScheme.onBackground,
    );

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: backgroundDecoration,
      child: child,
    );
  }

  Widget buildBookView(BuildContext context) {
    EdgeInsetsGeometry padding = const EdgeInsets.all(32);
    return Center(
      child: Container(
        padding: padding,
        child: Image.asset(
          'assets/book_front.jpg',
        ),
      ),
    );
  }
}
