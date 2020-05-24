import 'package:TimeTracker/app/landing_page.dart';
import 'package:TimeTracker/services/auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingPage(
        auth: Auth(), //passing instance because AuthBase is an abstract class
      ),
    );
  }
}
