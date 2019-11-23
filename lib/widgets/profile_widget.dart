import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  const ProfileAvatar(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                height: 150,
                width: 150,
                placeholder: kTransparentImage,
                image: 'https://i.imgur.com/BoN9kdC.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(name, textScaleFactor: 1.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text("Developer"),
          )
        ],
      ),
    );
  }
}
