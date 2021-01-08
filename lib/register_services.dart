import 'package:get_it/get_it.dart';
import 'package:simple_expenses/models/expense.dart';
import 'package:simple_expenses/services/expense_service.dart';

GetIt getIt = GetIt.instance;

void registerServices() {
  getIt.registerSingleton<ExpenseService>(LocalExpenseService([
    Expense(
      amount: 23.95,
      date: DateTime.now(),
      notes: '',
      name: 'Chipotle Online',
      category: 'Fast Food',
    ),
    Expense(
      amount: 12.50,
      date: DateTime.now(),
      notes: '',
      name: 'Crimson Cup Coffee',
      category: 'Coffee & Tea',
    ),
    Expense(
      amount: 151.06,
      date: DateTime.now(),
      notes: '',
      name: 'Market District',
      category: 'Groceries',
    ),
    Expense(
      amount: 31.19,
      date: DateTime.parse('2021-01-05'),
      notes: '',
      name: 'Amazon.com',
      category: 'Household Supplies',
    ),
    Expense(
      amount: 11.47,
      date: DateTime.parse('2021-01-05'),
      notes: '',
      name: 'Taco Bell',
      category: 'Fast Food',
    ),
    Expense(
      amount: 21.14,
      date: DateTime.parse('2021-01-03'),
      notes: '',
      name: 'Get Go',
      category: 'Gasoline',
    ),
    Expense(
      amount: 23.95,
      date: DateTime.parse('2020-11-26'),
      notes: '',
      name: 'Chipotle Online',
      category: 'Fast Food',
    ),
    Expense(
      amount: 23.95,
      date: DateTime.parse('2021-01-01'),
      notes: '',
      name: 'Chipotle Online',
      category: 'Fast Food',
    ),
    Expense(
      amount: 23.95,
      date: DateTime.parse('2020-11-20'),
      notes: '',
      name: 'Chipotle Online',
      category: 'Fast Food',
    ),
    Expense(
      amount: 23.95,
      date: DateTime.parse('2020-11-15'),
      notes: '',
      name: 'Chipotle Online',
      category: 'Fast Food',
    ),
    Expense(
      amount: 23.95,
      date: DateTime.parse('2020-11-01'),
      notes: '',
      name: 'Chipotle Online',
      category: 'Fast Food',
    ),
  ]));
}
