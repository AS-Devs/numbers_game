import 'package:flutter/material.dart';

class FactPageView extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8
  );
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.lightBlue,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
            child: Center(
              child: Text(
                "Fact 1",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.purpleAccent,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
            child: Center(
              child: Text(
                "Fact 2",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.pink,
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
            child: Center(
              child: Text(
                "Fact 3",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
