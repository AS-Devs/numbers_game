import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';
import 'package:numbers_game/animations/page_route_transitions.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/screens/home_page.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FluttieAnimationController emojiAnimation;
  bool ready = false;

  @override
  void initState() {
    super.initState();
    prepareAnimation();
    startTimeout();
  }

  @override
  dispose() {
    super.dispose();
    emojiAnimation?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      color: themeProvider.getTheme.canvasColor,
      child: Center(
        child: ready
            ? SizedBox(
              width: 450,
              height: 380,
              child: FluttieAnimation(emojiAnimation),
            )
            : SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 3.0,
              ),
            ),
      ),
    );
  }

  prepareAnimation() async {
    bool canBeUsed = await Fluttie.isAvailable();
    if (!canBeUsed) {
      print("Animations are not supported on this platform");
      return;
    }

    var instance = Fluttie();
    var emojiComposition = await instance.loadAnimationFromAsset(
      "assets/animations/splash.json",
    );
    emojiAnimation = await instance.prepareAnimation(emojiComposition,
        duration: Duration(milliseconds: 3000),
        repeatCount: const RepeatCount.dontRepeat(),
        repeatMode: RepeatMode.START_OVER);

    if (mounted) {
      setState(() {
        ready = true;
        emojiAnimation.start();
      });
    }
  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, navigateToHomePage);
  }

  navigateToHomePage() {
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => HomePage()), (r) => false);
    Navigator.of(context)
        .pushAndRemoveUntil(ScaleRoute(page: HomePage()), (r) => false);
  }
}
