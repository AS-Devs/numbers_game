import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget {
  const CurvedAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Random Facts",
        textScaleFactor: 1.08,
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
      iconTheme: new IconThemeData(color: Colors.white),
      centerTitle: true,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0)),
      ),
      // brightness: Brightness.dark,
    );
  }
}
