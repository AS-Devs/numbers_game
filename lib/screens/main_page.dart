import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

enum ApiType { trivia, year, date, math }

class _MainPageState extends State<MainPage> {
  ApiType _type = ApiType.trivia;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      child: Center(
          child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 200.0,
        width: 400.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: themeProvider.getTheme.primaryColor),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: themeProvider.getTheme.primaryColor,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              ),
            ]),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: List<Widget>.generate(
            4,
            (int index) {
              return ChoiceChip(
                label: _getChipLabel(index),
                selected: _type.index == index,
                onSelected: (bool selected) {
                  setState(() {
                    _type = ApiType.values[index];
                  });
                },
              );
            },
          ).toList(),
        ),
      )),
    );
  }

  _getChipLabel(int index) {
    switch (index) {
      case 0:
        return Text("Trivia");
        break;
      case 1:
        return Text("Year");
        break;
      case 2:
        return Text("Date");
        break;
      case 3:
        return Text("Math");
        break;
      default:
        break;
    }
  }
}
