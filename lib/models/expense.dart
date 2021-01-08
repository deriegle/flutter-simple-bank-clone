import 'package:flutter/foundation.dart';

class Expense {
  final double amount;
  final DateTime date;
  final String notes;
  final String name;
  final String category;

  Expense({
    @required this.amount,
    @required this.date,
    @required this.notes,
    @required this.name,
    @required this.category,
  });
}
