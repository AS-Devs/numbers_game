import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

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
  }

  @override
  dispose() {
    super.dispose();
    emojiAnimation?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ready
            ? FluttieAnimation(emojiAnimation) // todo: Perform this animation in a seperate page and with animation completion navigate to main page
            : Text("Loading Animation..."),
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
      "assets/animations/welcome.json",
    );
    emojiAnimation = await instance.prepareAnimation(emojiComposition,
        duration: Duration(seconds: 2),
        repeatCount: const RepeatCount.infinite(),
        repeatMode: RepeatMode.START_OVER);

    if (mounted) {
      setState(() {
        ready = true;
        emojiAnimation.start();
      });
    }
  }
}
