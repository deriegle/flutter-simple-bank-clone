import 'package:simple_expenses/models/expense.dart';

abstract class ExpenseService {
  Future<void> load();
  List<Expense> all();
  List<DateTime> allDates();
  Expense find(String id);
  List<Expense> findByDate(DateTime date);
  Expense updateNotes(String id, String notes);
  Expense updateName(String id, String name);
  List<Expense> searchByName(String name);
  Expense add(Expense expense);
}

class LocalExpenseService implements ExpenseService {
  LocalExpenseService([this._expenses = const <Expense>[]]);

  List<Expense> _expenses;

  @override
  List<Expense> all() => _expenses;

  @override
  Expense find(String id) {
    return _expenses.firstWhere((expense) => expense.id == id, orElse: () => null);
  }

  @override
  Future<void> load() async {
    return null;
  }

  @override
  Expense updateName(String id, String name) {
    final index = _expenses.indexWhere((e) => e.id == id);

    if (index == -1) {
      throw StateError(
        'Expense with ID $id does not exist in LocalExpenseService and cannot be updated.',
      );
    }

    _expenses[index].updateName(name);

    return _expenses[index];
  }

  @override
  Expense updateNotes(String id, String notes) {
    final index = _expenses.indexWhere((e) => e.id == id);

    if (index == -1) {
      throw StateError(
        'Expense with ID $id does not exist in LocalExpenseService and cannot be updated.',
      );
    }

    _expenses[index].updateNotes(notes);

    return _expenses[index];
  }

  @override
  List<Expense> searchByName(String name) {
    return _expenses.where((e) => e.name.toLowerCase().contains(name.toLowerCase()));
  }

  @override
  List<Expense> findByDate(DateTime date) {
    return _expenses
        .where(
            (e) => e.date.day == date.day && e.date.month == date.month && e.date.year == date.year)
        .toList();
  }

  @override
  Expense add(Expense expense) {
    _expenses.add(expense);
    return expense;
  }

  @override
  List<DateTime> allDates() {
    final dates = _expenses
        .map((expense) => DateTime(expense.date.year, expense.date.month, expense.date.day))
        .toSet()
        .toList();

    return dates;
  }
}
