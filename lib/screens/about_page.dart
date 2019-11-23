import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/widgets/profile_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
            child: Text(
              "Team",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const ProfileAvatar("Ayon Das"),
              const ProfileAvatar("Susanta Chakraborty")
            ],
          ),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(children: [
          //     TextSpan(text: "This app is powered by an awesome API called "),
          //     TextSpan(
          //         text: "Numbers API",
          //         style: TextStyle(color: Colors.blue),
          //         recognizer: TapGestureRecognizer()
          //           ..onTap = () => launch("http://numbersapi.com/"))
          //   ], style: TextStyle(fontSize: 16.0)),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text("© 2019 AS Devs All Rights Reserved"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
