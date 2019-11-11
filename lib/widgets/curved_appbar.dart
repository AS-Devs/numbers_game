import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget {
  const CurvedAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Numbers Game",
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: new IconThemeData(color: Colors.white),
      centerTitle: true,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
                MediaQuery.of(context).size.width, 80.0)),
      ),
    );
  }
}