import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numbers_game/custom_icons/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  final String imagePath;
  final List<String> socialLinks;
  const ProfileAvatar(this.name, this.imagePath, this.socialLinks);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).indicatorColor, width: 4),
              borderRadius: BorderRadius.circular(100)
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: screenSize.height * 0.12,
                width: screenSize.height * 0.12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              name,
              textScaleFactor: 1.2,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(GithubIcon.github_circled),
                onPressed: () => launch(socialLinks[0]),
              ),
              IconButton(
                icon: Icon(FacebookIcon.facebook_squared),
                onPressed: () => launch(socialLinks[1]),
              ),
              IconButton(
                icon: Icon(LinkedInIcon.linkedin_squared),
                onPressed: () => launch(socialLinks[2]),
              )
            ],
          )
        ],
      ),
    );
  }
}
