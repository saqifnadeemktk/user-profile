import 'package:flutter/material.dart';
import 'package:my_project/view/screens/onboarding.dart';
import 'package:my_project/view/screens/signup.dart';
//import 'package:my_project/view/screens/selection.dart';
 import 'package:my_project/view/screens/signin.dart';
//import 'package:my_project/view/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}




