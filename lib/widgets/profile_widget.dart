import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numbers_game/custom_icons/custom_icons.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  final String imagePath;
  const ProfileAvatar(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).indicatorColor, width: 4),
              borderRadius: BorderRadius.circular(100)
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 90.0,
                width: 90.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              name,
              textScaleFactor: 1.1,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(GithubIcon.github_circled),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(FacebookIcon.facebook_squared),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LinkedInIcon.linkedin_squared),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
