import 'package:flutter/material.dart';
import 'package:numbers_game/webapis/services.dart';
import 'package:numbers_game/models/fact.dart';

void main() => runApp(NumbersGame());

class NumbersGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers Game',
      home: FisrtScreen(),
    );
  }
}

class FisrtScreen extends StatefulWidget {
  FisrtScreen({Key key}) : super(key: key);

  @override
  _FisrtScreenState createState() => _FisrtScreenState();
}

class _FisrtScreenState extends State<FisrtScreen> {
  Future<NumberFact> factFuture;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    factFuture = getYearFact(year: 2019.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFFBC9CFF),
              Color(0xFF8BA4F9),
            ],
          ),
        ),
        child: Center(
          child: Card(
              elevation: 10.0,
              margin: EdgeInsets.all(23.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter a number (Optional)',
                          contentPadding: EdgeInsets.all(10)),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.start,
                      controller: controller,
                    ),
                    FutureBuilder<NumberFact>(
                      future: factFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          NumberFact fact = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListTile(
                              contentPadding: EdgeInsets.all(20),
                              leading: Icon(
                                Icons.library_books,
                                size: 40.0,
                                color: Color(0xFFBC9CFF),
                              ),
                              title: Text(
                                fact.number.toString(),
                                style: TextStyle(
                                    color: Color(0xFF8BA4F9), fontSize: 20.0),
                              ),
                              subtitle: Text(fact.text),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(20),
                            leading: Icon(Icons.library_books),
                            title: Text(
                              'Error',
                              style: TextStyle(color: Colors.red),
                            ),
                            subtitle: Text(snapshot.error.toString()),
                          );
                        }
                        return Container(
                          child: LinearProgressIndicator(
                            backgroundColor: Color(0xFFBC9CFF),
                          ),
                          padding: EdgeInsets.all(30),
                        );
                      },
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          if (controller.text != null &&
                              controller.text.length > 0) {
                            factFuture = getMathFact(number: controller.text);
                          } else {
                            factFuture = getMathFact();
                          }
                        });
                      },
                      textColor: Colors.white,
                      elevation: 10.0,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        padding: const EdgeInsets.fromLTRB(23, 15, 23, 15),
                        child: const Text('GET FACT',
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4)),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
