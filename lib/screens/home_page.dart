import 'package:flutter/material.dart';
import 'package:numbers_game/widgets/curved_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CurvedAppBar(),
      ),
      drawer: Drawer(),
    ));
  }
}
