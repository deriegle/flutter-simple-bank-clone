import 'package:flutter/material.dart';

class NavigationController {
  final BuildContext context;

  NavigationController(this.context);

  static NavigationController of(BuildContext context) => NavigationController(context);

  void push(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => widget));
  }
}
