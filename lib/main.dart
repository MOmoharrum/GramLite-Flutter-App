import 'package:flutter/material.dart';
import 'package:flutter_data_operation/views/pages/home_page.dart';
import 'package:flutter_data_operation/views/pages/login_page.dart';
import 'package:flutter_data_operation/views/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gram Lite',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.grey.shade200),
      home: SplashPage(),
    );
  }
}
