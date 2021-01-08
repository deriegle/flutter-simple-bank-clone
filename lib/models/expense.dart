import 'package:flutter/foundation.dart';
import 'package:simple_expenses/uuid.dart';

class Expense {
  final String id;
  final double amount;
  final DateTime date;
  final String transactionName;
  final String category;
  final String location;
  String _name;

  String _notes;

  Expense({
    String id,
    @required this.amount,
    @required this.date,
    @required String notes,
    @required String name,
    @required this.category,
    this.location,
  })  : this.id = id ?? uuid.v4(),
        transactionName = name,
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
