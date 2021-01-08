import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:simple_expenses/models/expense.dart';

final listOfDates = [
  DateTime.now(),
  DateTime.parse('2021-01-03'),
  DateTime.parse('2021-01-01'),
  DateTime.parse('2020-11-25'),
  DateTime.parse('2020-11-15'),
  DateTime.parse('2020-11-10'),
  DateTime.parse('2020-11-05'),
  DateTime.parse('2020-11-01'),
];

const months = [
  null,
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'November',
  'December',
];

const dayOfWeek = [
  null,
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  final bool isFirst;

  const ExpenseTile({Key key, @required this.expense, @required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        title:
            Text(expense.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
    );
  }
}

class ExpenseList extends StatelessWidget {
  String formattedDate(DateTime d) {
    final inTheLastWeek = DateTime.now().difference(d).inDays <= 7;
    final month = months[d.month];

    if (inTheLastWeek) {
      return '${dayOfWeek[d.weekday]}, $month ${d.day}';
    }

    return '$month ${d.day}, ${d.year}';
  }

  Widget buildExpenseListForIndex(int index) {
    if (index.isEven) {
      return Column(
        children: <Widget>[
          ExpenseTile(
            isFirst: true,
            expense: Expense(
              amount: 23.95,
              name: 'Chipotle Online',
              date: DateTime.now(),
              category: 'Fast Food',
              notes: '',
            ),
          ),
          ExpenseTile(
            isFirst: false,
            expense: Expense(
              amount: 12.50,
              name: 'Crimson Cup Coffee',
              date: DateTime.now(),
              category: 'Coffee & Tea',
              notes: '',
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          ExpenseTile(
            isFirst: true,
            expense: Expense(
              amount: 12.50,
              name: 'Crimson Cup Coffee',
              date: DateTime.now(),
              category: 'Coffee & Tea',
              notes: '',
            ),
          ),
          ExpenseTile(
            isFirst: false,
            expense: Expense(
              amount: 15.04,
              name: 'Amazon.com',
              date: DateTime.now(),
              category: 'Books',
              notes: '',
            ),
          ),
          ExpenseTile(
            isFirst: false,
            expense: Expense(
              amount: 151.06,
              name: 'Market District',
              date: DateTime.now(),
              category: 'Groceries',
              notes: '',
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemBuilder: (context, index) {
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
                formattedDate(listOfDates[index]),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: buildExpenseListForIndex(index),
          );
        },
        itemCount: listOfDates.length,
      ),
    );
  }
}
