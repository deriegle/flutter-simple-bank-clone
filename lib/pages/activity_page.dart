import 'package:flutter/material.dart';
import 'package:simple_expenses/app_drawer.dart';
import 'package:simple_expenses/expense_list.dart';
import 'package:simple_expenses/more_actions_button.dart';
import 'package:simple_expenses/register_services.dart';
import 'package:simple_expenses/safe_to_spend.dart';
import 'package:simple_expenses/services/expense_service.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  TextEditingController searchTextController;
  bool isSearching = false;

  String get searchText => searchTextController.text;

  @override
  void initState() {
    searchTextController = TextEditingController(text: '');
    super.initState();
  }

  void onMoreActionPress(MoreActions action) async {
    switch (action) {
      case MoreActions.refresh:
        await getIt.get<ExpenseService>().load();
        break;
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
          onSubmitted: (t) {},
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          searchText.isEmpty
              ? Container()
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchTextController.text = '';
                    });
                  },
                ),
        ],
        bottom: safeToSpend,
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      title: Text('Activity'),
      actions: <Widget>[MoreActionsButton(onSelected: onMoreActionPress)],
      bottom: safeToSpend,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ExpenseList(
        searchText: searchTextController.text,
      ),
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
