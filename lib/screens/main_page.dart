import 'package:flutter/material.dart';
import 'package:numbers_game/models/fact.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/webapis/services.dart';
import 'package:provider/provider.dart';
//import 'package:vector_math/vector_math.dart' as math;

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

enum ApiType { trivia, year, date, math }

class _MainPageState extends State<MainPage> {
  ApiType _type = ApiType.trivia;
  List<bool> isSelectedFactTypes = [true, false, false, false];
  List<bool> isSelectedNumberTypes = [true, false];
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: ToggleButtons(
            children: <Widget>[
              Text("Trivia"),
              Text("Year"),
              Text("Date"),
              Text("Math")
            ],
            selectedColor: Colors.white,
            fillColor: themeProvider.getTheme.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            borderColor: themeProvider.getTheme.primaryColor,
            selectedBorderColor: themeProvider.getTheme.primaryColor,
            isSelected: isSelectedFactTypes,
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelectedFactTypes.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelectedFactTypes[buttonIndex] = true;
                    _type = ApiType.values[index];
                  } else {
                    isSelectedFactTypes[buttonIndex] = false;
                  }
                }
              });
            },
          ),
        ),
        Center(
          child: ToggleButtons(
            children: <Widget>[
              Text("Random"),
              Text("Choose"),
            ],
            selectedColor: Colors.white,
            fillColor: themeProvider.getTheme.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            borderColor: themeProvider.getTheme.primaryColor,
            selectedBorderColor: themeProvider.getTheme.primaryColor,
            isSelected: isSelectedNumberTypes,
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelectedNumberTypes.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelectedNumberTypes[buttonIndex] = true;
                  } else {
                    isSelectedNumberTypes[buttonIndex] = false;
                  }
                }
              });
            },
          ),
        ),
        Visibility(
          visible: isSelectedNumberTypes[1] == true ? true : false,
          maintainState: true,
          maintainAnimation: true,
          child: Container(
            width: 150.0,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  // labelText: 'Enter a number',
                  hintText: 'Enter Number',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0)),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              controller: controller,
            ),
          ),
        ),
        RaisedButton(
          child: Text("Get Facts",
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4)),
          color: themeProvider.getTheme.primaryColor,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {
            _getFact();
            setState(() {
              FocusScope.of(context).unfocus();
            });
          },
        ),
        // FutureBuilder<Fact>(
        //   future: factFuture,
        //   builder: (con, snapshot) {
        //     if (snapshot.hasData) {
        //       Fact fact = snapshot.data;
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         setState(() {
        //           SchedulerBinding.instance.addPostFrameCallback((_) => _showFact(context, fact));
        //           //_showFact(context, fact);
        //         });
        //       }
        //     } else if (snapshot.hasError) {}
        //     return Container(height: 0.0, width: 0.0);
        //   },
        // )
      ],
    );
  }

  void _getFact() async {
    switch (_type) {
      case ApiType.trivia:
        if (isSelectedNumberTypes[0]) {
          _showFact(context, getTriviaFact());
        } else {
          _showFact(context, getTriviaFact(number: controller.text));
        }
        break;
      case ApiType.year:
        if (isSelectedNumberTypes[0]) {
          _showFact(context, getYearFact());
        } else {
          _showFact(context, getYearFact(year: controller.text));
        }
        break;
      case ApiType.date:
        if (isSelectedNumberTypes[0]) {
          _showFact(context, getDateFact());
        } else {
          _showFact(context, getDateFact(date: controller.text));
        }
        break;
      case ApiType.math:
        if (isSelectedNumberTypes[0]) {
          _showFact(context, getMathFact());
        } else {
          _showFact(context, getMathFact(number: controller.text));
        }
        break;
      default:
        break;
    }
  }

  void _showFact(BuildContext context, Future<Fact> factFuture) {
    factFuture.then((fact) {
      showGeneralDialog(
          barrierColor: Colors.black38,
          transitionBuilder: (context, ani1, ani2, widget) {
            return Transform.scale(
              scale: ani1.value,
              child: Opacity(
                opacity: ani1.value,
                child: AlertDialog(
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Text(fact.number),
                  content: Text(fact.text),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 500),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {});
    });
  }
}
