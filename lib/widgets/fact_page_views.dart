import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/utils/connectivity.dart';
import 'package:numbers_game/webapis/services.dart';
import 'package:numbers_game/widgets/number_fact_widget.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class FactPageView extends StatefulWidget {
  @override
  _FactPageViewState createState() => _FactPageViewState();
}

class _FactPageViewState extends State<FactPageView>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0, viewportFraction: 0.8);
  Color _colorValue = Colors.blue;
  double _size = 180.0;
  bool isNumberFactLoading = false,
      isGeneralFactLoading = false,
      isQuotaFactLoading = false,
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
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Number Facts",
                            style: TextStyle(
                                color: themeProvider.getTheme.indicatorColor,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text("Choose any type of Number Fact",
                              style: TextStyle(
                                  color: themeProvider.getTheme.indicatorColor,
                                  fontSize: 15.0)),
                        )),
                    NumberFactWidget()
                  ],
                ))),
        Container(
          color: Colors.transparent,
          child: Card(
              color: Colors.redAccent,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Fun Facts",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text("Click to get Fun Facts",
                            style: TextStyle(
                                color: Colors.white60, fontSize: 15.0)),
                      )),
                  Center(
                    child: isGeneralFactLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : SizedBox.shrink(),
                  ),
                  Center(
                    child: TweenAnimationBuilder<double>(
                      key: UniqueKey(),
                      tween: Tween<double>(begin: 60.0, end: _size),
                      duration: Duration(seconds: 2),
                      curve: Curves.elasticInOut,
                      builder: (_, double size, Widget child) {
                        return Ink.image(
                          image: AssetImage("assets/images/fun-fact.png"),
                          height: size,
                          child: InkWell(
                            onTap: () {
                              if (isNumberFactLoading ||
                                  isCatFactLoading ||
                                  isQuotaFactLoading) return;
                              setState(() {
                                isGeneralFactLoading = true;
                              });
                              _getFact(context);
                            },
                          ),
                        );
                      },
                      onEnd: () =>
                          setState(() => _size = _size == 180.0 ? 60.0 : 180.0),
                    ),
                  )
                ],
              )),
        ),
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.blueAccent,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Quota Facts",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text("Click to get Quota Facts",
                          style:
                              TextStyle(color: Colors.white60, fontSize: 15.0)),
                    )),
                Center(
                  child: isCatFactLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text("Quota Facts Image"),
                )
              ],
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Card(
            color: Colors.black,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
            child: Stack(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Cat Facts",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text("Click to get Facts about Cats",
                        style:
                            TextStyle(color: Colors.white60, fontSize: 15.0)),
                  )),
              Center(
                child: isCatFactLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : SizedBox.shrink(),
              ),
              Center(
                child: TweenAnimationBuilder<Color>(
                  key: UniqueKey(),
                  tween: ColorTween(begin: Colors.red, end: _colorValue),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  builder: (BuildContext _, Color value, Widget child) {
                    return Ink.image(
                      image: AssetImage("assets/images/cat-eye.jpg"),
                      colorFilter: ColorFilter.mode(value, BlendMode.modulate),
                      fit: BoxFit.contain,
                      child: InkWell(
                        onTap: () {
                          if (isNumberFactLoading ||
                              isGeneralFactLoading ||
                              isQuotaFactLoading) return;
                          setState(() {
                            isCatFactLoading = true;
                          });
                          _getFact(context);
                        },
                      ),
                    );
                  },
                  onEnd: () => setState(() => _colorValue =
                      _colorValue == Colors.blue ? Colors.red : Colors.blue),
                ),
              ),
            ]),
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
          _showFact(context, "Fun Fact", generalFact.text);
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
                      icon: Icon(Icons.save),
                      padding: EdgeInsets.zero,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
