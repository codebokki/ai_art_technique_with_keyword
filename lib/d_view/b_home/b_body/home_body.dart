import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double aspectRatio = 1;

  int selectedEmotion = 0;

  List<String> imagePath = [
    'assets/character/idle.webp',
    'assets/character/smile.webp',
    'assets/character/sad.webp',
    'assets/character/angry.webp',
  ];
  List<Image> imageList = [];

  List<String> buttonString = [
    '기본',
    '행복',
    '슬픔',
    '화남',
  ];

  List<List<String>> dialogList = [
    // IDLE
    [
      '저기, 그 책 사줄래? 별로 중요한 건 아니야.',
      '하지만 네가 사준다면... 아, 아니야. 신경 쓰지 마.',
      '하지만 사준다면 고맙긴 할 거야, 당연하지.',
    ],
    // SMILE
    [
      '이 책, 꽤 괜찮아 보여서 말인데... 네가 읽으면 좋을 것 같아.',
      '내가 널 위해서 추천해주는 건 아니니까 오해하지 마!',
      '그냥... 네가 좋아할 만한 책 같아서.',
    ],
    // SAD
    [
      '이 책을 사주지 않을 거야? 난... 난 괜찮아.',
      '사실은 정말 읽고 싶었지만... 네가 싫다면 어쩔 수 없지.',
      '내 마음대로 할 수는 없으니까.',
    ],
    // ANGRY
    [
      '이 책 안 사준다고?',
      '다른 건 몰라도 이건 정말 필요해!',
      '네가 안 사준다면... 네가 후회할 거야, 진짜로!',
    ],
  ];

  int dialogMaxNumber = 3;

  Random random = Random();

  double xPosition = 10.0;
  double yPosition = 10.0;

  @override
  void initState() {
    super.initState();

    getImageList();
  }

  @override
  Widget build(BuildContext context) {
    return buildBackgroundLayout(
      context,
      child: buildBackground(
        context,
        child: buildContentLayout(
          context,
          children: [
            buildCharacterView(context),
            buildEmotionSelectButtonBar(context),
            buildDialog(
              context,
              dialog: dialogList[selectedEmotion]
                  [random.nextInt(dialogMaxNumber)],
            ),
            buildBuyBookNow(context),
          ],
        ),
      ),
    );
  }

  Widget buildBackgroundLayout(
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
      color: colorScheme.background,
    );

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setDialogPosition(details.localPosition);
      },
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: backgroundDecoration,
        child: child,
      ),
    );
  }

  Widget buildContentLayout(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Stack(
      children: children,
    );
  }

  Widget buildCharacterView(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: imageList[selectedEmotion],
    );
  }

  Widget buildEmotionSelectButtonBar(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    TextTheme textTheme = themeData.textTheme;

    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: buttonString.asMap().entries.map((entry) {
        int index = entry.key;
        String title = entry.value;
        return FilledButton(
          onPressed: () {
            setState(() {
              selectedEmotion = index;
            });
          },
          child: Text(
            title,
            style: textTheme.titleSmall!.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildBuyBookNow(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;
    TextTheme textTheme = themeData.textTheme;

    String buyBookText = '책 구입하기';

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => openUrlInNewWindow(),
              child: Text(
                buyBookText,
                style: textTheme.titleSmall!.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget buildDialog(
    BuildContext context, {
    required String dialog,
  }) {
    ThemeData themeData = Theme.of(context);
    ColorScheme colorScheme = themeData.colorScheme;

    return Positioned(
      left: xPosition,
      top: yPosition,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          dialog,
          style: TextStyle(color: colorScheme.background),
        ),
      ),
    );
  }

  void getImageList() {
    setState(() {
      imageList = imagePath.map((name) {
        return Image.asset(name);
      }).toList();
    });
  }

  void openUrlInNewWindow() {
    html.window.open(
      'https://product.kyobobook.co.kr/detail/S000212222416',
      '_black',
    );
  }

  void setDialogPosition(Offset localPosition) {
    setState(() {
      xPosition = localPosition.dx;
      yPosition = localPosition.dy;
    });
  }
}
