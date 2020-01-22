import 'package:flutter/material.dart';
import 'package:numbers_game/models/fact.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/utils/connectivity.dart';
import 'package:numbers_game/webapis/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class FactPageView extends StatefulWidget {
  @override
  _FactPageViewState createState() => _FactPageViewState();
}

class _FactPageViewState extends State<FactPageView>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0, viewportFraction: 0.8);
  bool isNumberFactLoading = false,
      isGeneralFactLoading = false,
      isCatFactLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: Card(
              color: themeProvider.getTheme.cardColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: themeProvider.getTheme.primaryColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Number Facts",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      isNumberFactLoading
                          ? Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : IconButton(
                              icon: Icon(Icons.refresh),
                              color: Colors.white,
                              iconSize: 32.0,
                              onPressed: () {
                                if (isGeneralFactLoading || isCatFactLoading)
                                  return;
                                setState(() {
                                  isNumberFactLoading = true;
                                });
                              },
                            )
                    ],
                  ),
                ),
              )),
        ),
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.purpleAccent,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: themeProvider.getTheme.primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "General Facts",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    isGeneralFactLoading
                        ? Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.refresh),
                            color: Colors.white,
                            iconSize: 32.0,
                            onPressed: () {
                              if (isNumberFactLoading || isCatFactLoading)
                                return;
                              setState(() {
                                isGeneralFactLoading = true;
                              });
                              _getFact(context);
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.pink,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: themeProvider.getTheme.primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Cat Facts",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    isCatFactLoading
                        ? Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.refresh),
                            color: Colors.white,
                            iconSize: 32.0,
                            onPressed: () {
                              setState(() {
                                if (isNumberFactLoading || isGeneralFactLoading)
                                  return;
                                isCatFactLoading = true;
                              });
                              _getFact(context);
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getFact(BuildContext context) async {
    var isNetworkConnected = await NetworkConnectivity.isNetworkConnected();
    if (isNetworkConnected) {
      if (isNumberFactLoading) {
      } else if (isGeneralFactLoading) {
        getGeneralFact().then((generalFact) {
          setState(() {
            isGeneralFactLoading = false;
          });
          _showFact(context, "Cool Fact", generalFact.text);
        });
      } else if (isCatFactLoading) {
        getCatFact().then((catFact) {
          setState(() {
            isCatFactLoading = false;
          });
          _showFact(context, "Cat Fact", catFact.text);
        });
      }
    }
  }

  _showFact(BuildContext context, String title, String text) {
    showModalBottomSheet(
        context: context,
        elevation: 5.0,
        isDismissible: true,
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        builder: (BuildContext bc) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontFamily: 'Muli',
                            fontSize: 38.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      padding: EdgeInsets.zero,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                        Share.share(
                            "Check out this awesome fact: \n\n$text\n\nFor More: App Link!",
                            subject: 'Awesome Fact by Random Fact App!');
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5),
                ),
              )
            ],
          );
        });
  }
}
