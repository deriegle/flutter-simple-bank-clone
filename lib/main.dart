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
  TextEditingController searchTextController;
  bool isSearching = false;

  String get searchText => searchTextController.text;

  @override
  void initState() {
    searchTextController = TextEditingController(text: '');
    super.initState();
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

  AppBar buildAppBar(BuildContext context) {
    final backgroundColor = Colors.black.withAlpha(230);
    final safeToSpend = SafeToSpend(amount: 0, onPressed: () => onSafeToSpendPress(context));

    if (isSearching) {
      return AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            setState(() {
              isSearching = false;
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: TextField(
          autofocus: true,
          maxLines: 1,
          controller: searchTextController,
          onChanged: (t) => setState(() {}),
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          searchText.isEmpty
              ? Container()
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchTextController.text = '';
                  },
                ),
        ],
        bottom: SafeToSpend(amount: 0, onPressed: () => onSafeToSpendPress(context)),
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(widget.title),
      actions: <Widget>[MoreActionsButton(onSelected: onMoreActionPress)],
      bottom: SafeToSpend(amount: 0, onPressed: () => onSafeToSpendPress(context)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ExpenseList(),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            searchTextController.text = '';
            isSearching = true;
          });
        },
        backgroundColor: Colors.blue,
        tooltip: 'Search for transactions',
        child: Icon(Icons.search),
      ),
    );
  }
}
