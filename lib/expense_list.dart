import 'package:flutter/material.dart';
import 'package:simple_expenses/date_formatter.dart';
import 'package:simple_expenses/navigation_controller.dart';
import 'package:simple_expenses/pages/expense_show_page.dart';
import 'package:simple_expenses/register_services.dart';
import 'package:simple_expenses/services/expense_service.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:simple_expenses/models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  final bool isFirst;

  const ExpenseTile({Key key, @required this.expense, @required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationController.of(context).push(ExpenseShowPage(expense: expense));
      },
      child: Container(
        decoration: BoxDecoration(
          border: isFirst
              ? null
              : Border(
                  top: BorderSide(width: 1, color: Colors.white10),
                ),
          color: Colors.white12,
        ),
        child: ListTile(
          leading: CircleAvatar(child: Text('D')),
          title: Text(expense.name,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text('Spent from Safe-to-Spend', style: TextStyle(color: Colors.grey)),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('\$${expense.amount.toStringAsFixed(2)}', style: TextStyle(color: Colors.red)),
              Text(expense.category, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  final String searchText;

  const ExpenseList({Key key, this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = getIt.get<ExpenseService>();
    final dates = service.allDates();

    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final date = dates[index];
          final expenses = service.findByDate(date);
          final filteredExpenses = searchText != null && searchText.isNotEmpty
              ? expenses
                  .where((e) => e.name.toLowerCase().contains(searchText.toLowerCase()))
                  .toList()
              : expenses;

          if (filteredExpenses.isEmpty) {
            return Container();
          }

          return StickyHeader(
              header: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    top: BorderSide(color: Colors.white30, width: 0.5),
                    bottom: BorderSide(color: Colors.white30, width: 0.5),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormatter.formatForExpenseList(date),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              content: Column(
                children: filteredExpenses.asMap().entries.map<Widget>((entry) {
                  return ExpenseTile(
                    expense: entry.value,
                    isFirst: entry.key == 0,
                  );
                }).toList(),
              ));
        },
        itemCount: dates.length,
      ),
    );
  }
}
