import 'package:ex/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ex/screens/bookmarks.dart';
import 'package:ex/screens/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  DatabaseHelper databaseHelper = DatabaseHelper();
  databaseIsEmpty = prefs.getBool('db');
  await databaseHelper.initDB();
  dishesList = await databaseHelper.retrieveDishes();
  for (int i = 0; i < dishesList.length; i++) {
    prefs.getBool('isFavorite${dishesList[i].id}') == true
        ? {dishesList[i].isFavorite = true, bookmarksList.add(dishesList[i])}
        : dishesList[i].isFavorite = false;
  }
  runApp(const MyApp(widgetChild: MenuScreen()));
}

class MyApp extends StatelessWidget {
  final Widget widgetChild;

  const MyApp({super.key, required this.widgetChild});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scommesse',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFFFFFF, color),
        ),
        home: SplashScreen(
          child: widgetChild,
        ),
        routes: {
          '/menu': (context) => const MenuScreen(),
          '/bookmarks': (context) => const BookmarksScreen()
        });
  }
}

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 255, 255, .1),
  100: const Color.fromRGBO(255, 255, 255, .2),
  200: const Color.fromRGBO(255, 255, 255, .3),
  300: const Color.fromRGBO(255, 255, 255, .4),
  400: const Color.fromRGBO(255, 255, 255, .5),
  500: const Color.fromRGBO(255, 255, 255, .6),
  600: const Color.fromRGBO(255, 255, 255, .7),
  700: const Color.fromRGBO(255, 255, 255, .8),
  800: const Color.fromRGBO(255, 255, 255, .9),
  900: const Color.fromRGBO(255, 2552, 255, 1),
};



