import 'package:flutter/material.dart';
import 'package:numbers_game/webapis/services.dart';
import 'package:numbers_game/models/fact.dart';

void main() => runApp(NumbersGame());

class NumbersGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers Game',
      home: FisrtScreen(title: 'Numbers Game'),
    );
  }
}

class FisrtScreen extends StatefulWidget {
  FisrtScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FisrtScreenState createState() => _FisrtScreenState();
}

class _FisrtScreenState extends State<FisrtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
            elevation: 5.00,
            margin: EdgeInsets.all(23.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column( 
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.all(20),
                    leading: Icon(Icons.library_books),
                    title: Text('Title'),
                    subtitle: Text('Subs'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print('Button Pressed');
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFFBC9CFF),
                              Color(0xFF8BA4F9),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      padding: const EdgeInsets.fromLTRB(23, 15, 23, 15),
                      child: const Text('TRY AGAIN',
                          style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, letterSpacing: 0.4 )),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
