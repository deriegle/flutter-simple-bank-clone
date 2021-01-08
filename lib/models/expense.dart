import 'package:flutter/foundation.dart';

class Expense {
  final double amount;
  final DateTime date;
  final String transactionName;
  final String category;
  final String location;
  String _name;

  String _notes;

  Expense({
    @required this.amount,
    @required this.date,
    @required String notes,
    @required String name,
    @required this.category,
    this.location,
  })  : transactionName = name,
        _name = name,
        _notes = notes;

  String get name => _name ?? transactionName;
  String get notes => _notes;

  Future<void> updateNotes(String notes) async {
    _notes = notes;
  }

  Future<void> updateName(String name) async {
    _name = name;
  }
}
