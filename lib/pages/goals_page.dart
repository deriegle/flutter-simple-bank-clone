import 'package:flutter/material.dart';
import 'package:simple_expenses/app_drawer.dart';
import 'package:simple_expenses/more_actions_button.dart';
import 'package:simple_expenses/navigation_controller.dart';
import 'package:simple_expenses/pages/new_goal_page.dart';
import 'package:simple_expenses/register_services.dart';
import 'package:simple_expenses/services/expense_service.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  bool showFab = true;

  void onMoreActionPress(MoreActions action) async {
    switch (action) {
      case MoreActions.refresh:
        await getIt.get<ExpenseService>().load();
        break;
    }
  }

  void showFloatingActionButton(bool show) {
    setState(() {
      showFab = show;
    });
  }

  Widget buildSortByOption(String name) {
    return Row(
      children: <Widget>[
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ),
        Text(name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.black.withAlpha(230);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Goals'),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.sort, color: Colors.blue),
                onPressed: () async {
                  final future = showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return Container(
                        color: backgroundColor,
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Sort by',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            buildSortByOption('Amount Saved'),
                            buildSortByOption('Target Date'),
                            buildSortByOption('Name (A-Z)'),
                          ],
                        ),
                      );
                    },
                    backgroundColor: backgroundColor,
                  );

                  showFloatingActionButton(false);

                  await future;

                  showFloatingActionButton(true);
                },
              );
            },
          ),
          MoreActionsButton(onSelected: onMoreActionPress),
        ],
      ),
      body: Center(child: Text('Hi there')),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            NavigationController.of(context).push(NewGoalPage(), fullScreenDialog: true),
        backgroundColor: Colors.blue,
        tooltip: 'Create new Goal',
        child: Icon(Icons.add),
      ),
    );
  }
}
