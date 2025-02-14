import 'package:flutter/material.dart';
import 'package:monday/pages/signup.dart';
import 'package:monday/pages/login.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => SignupPage(),
      '/login':(context)=>signinPage()
    },
  ));
}


