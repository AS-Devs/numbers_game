import 'package:flutter/material.dart';
import 'package:numbers_game/providers/theme_provider.dart';
import 'package:numbers_game/screens/about_page.dart';
import 'package:numbers_game/screens/main_page.dart';
import 'package:numbers_game/screens/settings_page.dart';
import 'package:numbers_game/widgets/curved_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget activePage = const MainPage();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: const CurvedAppBar(),
      ),
      drawer: buildDrawer(context),
      body: activePage,
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
            decoration:
                BoxDecoration(color: themeProvider.getTheme.primaryColor),
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
        activePage = const MainPage();
        break;
      case 1:
        activePage = const SettingsPage();
        break;
      case 2:
        activePage = const AboutPage();
        break;
      default:
        break;
    }
  }
}
