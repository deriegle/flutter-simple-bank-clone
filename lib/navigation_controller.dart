import 'package:flutter/material.dart';

class NavigationController {
  final BuildContext context;

  NavigationController(this.context);

  static NavigationController of(BuildContext context) => NavigationController(context);

  void pop<T extends Object>([T obj]) {
    Navigator.of(context).pop<T>(obj);
  }

  void push(Widget widget, {bool fullScreenDialog = false}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => widget,
        fullscreenDialog: fullScreenDialog,
      ),
    );
  }
}
