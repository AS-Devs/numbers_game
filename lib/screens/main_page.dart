import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:numbers_game/models/fact.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/webapis/services.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

enum ApiType { trivia, year, date, math }

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  ApiType _type = ApiType.trivia;
  List<bool> isSelectedFactTypes = [true, false, false, false];
  List<bool> isSelectedNumberTypes = [true, false];
  TextEditingController controller;
  int _date = 1;
  List<int> year = [1, 0, 0, 0];
  bool buttonClicked = false;

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
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          vsync: this,
          child: _getInputChild(_type, themeProvider),
        ),
        ButtonTheme(
          minWidth: 200.0,
          height: 45.0,
          child: RaisedButton(
            child: buttonClicked
                ? CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3.0,
                  )
                : Text("Get Facts",
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4)),
            color: themeProvider.getTheme.primaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              setState(() {
                buttonClicked = true;
                FocusScope.of(context).unfocus();
              });
              _getFact();
            },
          ),
        ),
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
          _showFact(context, getYearFact(year: year.join()));
        }
        break;
      case ApiType.date:
        if (isSelectedNumberTypes[0]) {
          _showFact(context, getDateFact());
        } else {
          _showFact(context, getDateFact(date: _date.toString()));
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
      setState(() {
        buttonClicked = false;
      });
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
                  title: Text("Fact"),
                  content: Text(fact.text),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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

  _getInputChild(ApiType apiType, DynamicTheme themeProvider) {
    if (isSelectedNumberTypes[0]) {
      //return Container(height: 0.0, width: 0.0);
      return SizedBox.shrink();
    } else {
      switch (apiType) {
        case ApiType.trivia:
        case ApiType.math:
          return Container(
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themeProvider.getTheme.primaryColor,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themeProvider.getTheme.primaryColor,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  // labelText: 'Enter a number',
                  prefixIcon: Icon(
                    Icons.search,
                    color: themeProvider.getTheme.primaryColor,
                  ),
                  focusColor: themeProvider.getTheme.primaryColor,
                  fillColor: themeProvider.getTheme.primaryColor,
                  hintText: 'Enter Number',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0)),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              controller: controller,
            ),
          );
          break;
        case ApiType.date:
          return NumberPicker.integer(
            decoration: BoxDecoration(),
            initialValue: _date,
            minValue: 1,
            maxValue: 31,
            onChanged: (newValue) {
              setState(() {
                _date = newValue;
              });
            },
          );
          break;
        case ApiType.year:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int index = 0; index < year.length; index++)
                NumberPicker.integer(
                  listViewWidth: 70.0,
                  initialValue: year[index],
                  minValue: 0,
                  maxValue: 9,
                  onChanged: (newValue) {
                    setState(() {
                      year[index] = newValue;
                    });
                  },
                )
            ],
          );
          break;
        default:
          break;
      }
    }
  }
}
