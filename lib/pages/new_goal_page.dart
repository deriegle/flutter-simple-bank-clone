import 'package:flutter/material.dart';
import 'package:simple_expenses/navigation_controller.dart';
import 'package:simple_expenses/safe_to_spend.dart';

class NewGoalPage extends StatefulWidget {
  @override
  _NewGoalPageState createState() => _NewGoalPageState();
}

class _NewGoalPageState extends State<NewGoalPage> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.black.withAlpha(230);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => NavigationController.of(context).pop(),
        ),
        backgroundColor: backgroundColor,
        title: Text('Set a Goal'),
        actions: <Widget>[],
        bottom: SafeToSpend(
          amount: 173.14,
          onPressed: () {
            /// open safe to spend dialog
          },
        ),
      ),
      body: Center(child: Text('Hi there')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // NavigationController.of(context).push(NewGoalsPage())
        },
        backgroundColor: Colors.blue,
        tooltip: 'Create new Goal',
        child: Icon(Icons.add),
      ),
    );
  }
}
