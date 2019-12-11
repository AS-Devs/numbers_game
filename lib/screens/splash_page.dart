import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';
import 'package:numbers_game/screens/home_page.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  // @override
  // void initState() async {
  //   super.initState();
  //   var instance = Fluttie();
  //   var emojiComposition = await instance.loadAnimationFromAsset(
  //     "assets/animations/welcome.json",
  //   );
  //   var emojiAnimation = await instance.prepareAnimation(emojiComposition);
  //   emojiAnimation.start();
  // }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('SPLASH ANIMATION HERE...'),
      ),
    );
  }
}