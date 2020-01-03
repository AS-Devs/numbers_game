import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/widgets/profile_widget.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String version;
  double size = 10.0;
  static const String ayonImagePath = 'assets/images/ayon.jpg';
  static const String susantaImagePath = 'assets/images/susanta.jpg';

  static const List<String> ayonSocialLinks = ["https://github.com/AyonAB", "https://www.facebook.com/ayan.loves.alterbridge", "www.linkedin.com/in/das-ayonab"];
  static const List<String> susantaSocialLinks = ["https://github.com/susanta96", "https://www.facebook.com/chakraboty.susanta", "https://www.linkedin.com/in/susanta96/"];

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
        size = 150.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlutterLogo(
              size: size,
              duration: Duration(seconds: 2),
              curve: Curves.bounceInOut,
            ),
          ),
          Text(
            "Random Facts",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: themeProvider.getTheme.iconTheme.color),
            textAlign: TextAlign.center,
          ),
          Text(
            "Version - $version",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: themeProvider.getTheme.indicatorColor),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 16.0),
            child: Text("Team Members",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    color: themeProvider.getTheme.indicatorColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const ProfileAvatar("Ayon Das", ayonImagePath, ayonSocialLinks),
                const ProfileAvatar("Susanta Chakraborty", susantaImagePath, susantaSocialLinks)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Powered by an awesome API called ",
                            style: TextStyle(
                                color: themeProvider.getTheme.indicatorColor)),
                        TextSpan(
                            text: "Numbers API",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launch("http://numbersapi.com/"))
                      ], style: TextStyle(fontSize: 16.0)),
                    ),
                    Text(
                      "© ${DateTime.now().year} AS Devs All Rights Reserved",
                      style: TextStyle(
                          color: themeProvider.getTheme.indicatorColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
