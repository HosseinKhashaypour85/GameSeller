import 'package:flutter/material.dart';
import 'package:game_shop/model/game_model.dart';
import 'package:game_shop/screens/first_screen.dart';
import 'package:game_shop/screens/main_screen.dart';
import 'package:game_shop/screens/signup_screen.dart';
import 'package:game_shop/screens/bottom_nav.dart';
// import 'package:game_shop/First_screen.dart';
// import 'signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "roboto"),
      home: BottomNavWidget(),
    );
  }
}
