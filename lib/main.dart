import 'package:flutter/material.dart';
import 'screens/Stepers/steper1_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/Stepers/Steper2_screen.dart';
import 'screens/Stepers/steper3_screen.dart';

// 0xff1f95a1

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      initialRoute:WelcomeScreen.routName ,
      routes: {
        WelcomeScreen.routName:(ctx)=>WelcomeScreen(),
        Steper1.routeName : (ctx)=> Steper1(),
        Steper2.routeName : (ctx) => Steper2(),
        Steper3.routeName : (ctx) => Steper3(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
