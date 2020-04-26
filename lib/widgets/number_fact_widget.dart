import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/utils/connectivity.dart';
import 'package:provider/provider.dart';

enum ApiType { trivia, year, date, math }

class NumberFactWidget extends StatefulWidget {
  @override
  _NumberFactWidgetState createState() => _NumberFactWidgetState();
}

class _NumberFactWidgetState extends State<NumberFactWidget> {
  bool _isTypeSelected = false;
  TextEditingController controller;
  ApiType _apiType;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        switchInCurve: Curves.easeInOutCirc,
        switchOutCurve: Curves.easeInOutCirc,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _isTypeSelected
            ? _getNumberInput(themeProvider)
            : _getNumberFactType());
  }

  Widget _getNumberInput(DynamicTheme themeProvider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 200.0,
            child: TextField(
              style: TextStyle(color: themeProvider.getTheme.iconTheme.color),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themeProvider.getTheme.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: themeProvider.getTheme.primaryColor, width: 2.0),
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
              maxLength: 10,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              controller: controller,
            ),
          ),
          FloatingActionButton.extended(
              onPressed: () => {setState(() => _isTypeSelected = !_isTypeSelected)},
              label: const Text("Submit"),
              icon: const Icon(Icons.refresh),
              heroTag: "Get Fact",
              backgroundColor: Colors.blueAccent)
        ],
      ),
    );
  }

  Widget _getNumberFactType() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            FloatingActionButton.extended(
                onPressed: () =>
                    {setState(() {
                      _isTypeSelected = !_isTypeSelected;
                      _apiType = ApiType.trivia;
                    })},
                label: const Text("Trivia"),
                icon: const Icon(Icons.games),
                heroTag: "Trivia",
                backgroundColor: Colors.blueAccent),
            FloatingActionButton.extended(
              onPressed: () =>
                  {setState(() {
                      _isTypeSelected = !_isTypeSelected;
                      _apiType = ApiType.math;
                    })},
              label: const Text("Math"),
              icon: const Icon(Icons.confirmation_number),
              heroTag: "Math",
              backgroundColor: Colors.deepPurpleAccent,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        Row(
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () =>
                  {setState(() => _isTypeSelected = !_isTypeSelected)},
              label: const Text("Year"),
              icon: const Icon(Icons.timer),
              heroTag: "Year",
              backgroundColor: Colors.tealAccent[700],
            ),
            FloatingActionButton.extended(
              onPressed: () =>
                  {setState(() => _isTypeSelected = !_isTypeSelected)},
              label: const Text("Date"),
              icon: const Icon(Icons.date_range),
              heroTag: "Date",
              backgroundColor: Colors.indigoAccent,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        )
      ],
    );
  }

  void _getFact() async {
    var isNetworkConnected = await NetworkConnectivity.isNetworkConnected();
    if (isNetworkConnected) {
      switch (_apiType) {
        case ApiType.trivia:
          if (controller.text.isEmpty) {
            //_showFactBottomSheet(context, getTriviaFact());
          } else {
            // _showFactBottomSheet(
            //     context, getTriviaFact(number: controller.text));
          }
          break;
        case ApiType.year:
          //_showFactBottomSheet(context, getYearFact());
          break;
        case ApiType.date:
          //_showFactBottomSheet(context, getDateFact());
          break;
        case ApiType.math:
          if (controller.text.isEmpty) {
            //_showFactBottomSheet(context, getMathFact());
          } else {
            //_showFactBottomSheet(context, getMathFact(number: controller.text));
          }
          break;
        default:
          break;
      }
    } else {
      _showError('No Internet Connectivity');
    }
  }

  void _showError(String error) {
    final snackBar = SnackBar(
      content: Text(error),
      elevation: 5.0,
      backgroundColor: Theme.of(context).accentColor,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
    setState(() {
    });
  }
}
