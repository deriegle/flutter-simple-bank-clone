import 'package:flutter/material.dart';
import 'package:simple_expenses/expense_list.dart';
import 'package:simple_expenses/more_actions_button.dart';
import 'package:simple_expenses/safe_to_spend.dart';
import 'package:simple_expenses/app_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Expenses',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'Activity'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void onMoreActionPress(MoreActions action) {
    switch (action) {
      case MoreActions.refresh:
        print('refreshing app....');
    }
  }

  onSafeToSpendPress(BuildContext ctx) {
    return showDialog<void>(
      context: ctx,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SafeToSpendDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(230),
        title: Text(widget.title),
        actions: <Widget>[MoreActionsButton(onSelected: onMoreActionPress)],
        bottom: SafeToSpend(amount: 0, onPressed: () => onSafeToSpendPress(context)),
      ),
      body: ExpenseList(),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
