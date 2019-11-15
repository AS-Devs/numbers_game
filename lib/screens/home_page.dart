import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/widgets/curved_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Container activeContainer = Container(
    child: Center(
      child: Text("This is Home"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: const CurvedAppBar(),
      ),
      drawer: buildDrawer(context),
      body: activeContainer,
    ));
  }

  Drawer buildDrawer(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(
            0.0), // Workaround for Statusbar color bug when drawer is open
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Numbers API",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text("Made with \u{1F497} by AS Devs",
                style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              setState(() {
                _drawerItemSelected(0, themeProvider);
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              setState(() {
                _drawerItemSelected(1, themeProvider);
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              setState(() {
                _drawerItemSelected(2, themeProvider);
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  _drawerItemSelected(int index, DynamicTheme themeProvider) {
    switch (index) {
      case 0:
        activeContainer = Container(
          child: Center(
            child: Text(
              "This is Home",
            ),
          ),
        );
        break;
      case 1:
        activeContainer = Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              RaisedButton(
                child: Text("Change Theme"),
                onPressed: (){
                  themeProvider.changeTheme(!themeProvider.isDarkTheme());
                },
              ),
              RaisedButton(
                child: Text("Change Primary Color"),
                onPressed: (){
                  themeProvider.changePrimaryColor(Colors.green);
                },
              )
            ],),
          ),
        );
        break;
      case 2:
        activeContainer = Container(
          child: Center(
            child: Text("This is About"),
          ),
        );
        break;
      default:
        break;
    }
  }
}
