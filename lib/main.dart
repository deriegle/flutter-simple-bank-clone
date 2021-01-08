import 'package:flutter/material.dart';
import 'package:simple_expenses/pages/activity_page.dart';
import 'package:simple_expenses/register_services.dart';

void main() {
  registerServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Expenses',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ActivityPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
