import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  bool _isLoading = false;

  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;

  ExpenseProvider() {
    // Initialize with sample data
    _loadSampleData();
  }

  void _loadSampleData() {
    _expenses = [
      Expense(
        id: '1',
        description: 'Lunch at Restaurant',
        amount: 25.50,
        category: 'Food',
        date: DateTime.now(),
      ),
      Expense(
        id: '2',
        description: 'Bus Ticket',
        amount: 5.00,
        category: 'Transport',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Expense(
        id: '3',
        description: 'Movie Tickets',
        amount: 30.00,
        category: 'Entertainment',
        date: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Expense(
        id: '4',
        description: 'Grocery Shopping',
        amount: 45.75,
        category: 'Food',
        date: DateTime.now().subtract(const Duration(days: 3)),
      ),
      Expense(
        id: '5',
        description: 'Electricity Bill',
        amount: 80.00,
        category: 'Bills',
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];
  }

  void addExpense(String description, double amount, String category) {
    final newExpense = Expense(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      description: description,
      amount: amount,
      category: category,
      date: DateTime.now(),
    );

    _expenses.insert(0, newExpense);
    notifyListeners();
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  void updateExpense(String id, String description, double amount, String category) {
    final index = _expenses.indexWhere((expense) => expense.id == id);
    if (index != -1) {
      _expenses[index] = Expense(
        id: id,
        description: description,
        amount: amount,
        category: category,
        date: _expenses[index].date,
      );
      notifyListeners();
    }
  }

  double get totalAmount {
    return _expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  double get monthlyTotal {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    return _expenses
        .where((expense) => expense.date.isAfter(firstDayOfMonth))
        .fold(0, (sum, expense) => sum + expense.amount);
  }

  double get weeklyTotal {
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return _expenses
        .where((expense) => expense.date.isAfter(firstDayOfWeek))
        .fold(0, (sum, expense) => sum + expense.amount);
  }

  Map<String, double> getCategoryTotals() {
    final Map<String, double> totals = {};

    for (var expense in _expenses) {
      totals.update(
        expense.category,
            (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    return totals;
  }

  List<Expense> getExpensesByCategory(String category) {
    if (category == 'All') return _expenses;
    return _expenses.where((expense) => expense.category == category).toList();
  }

  void refreshExpenses() {
    notifyListeners();
  }
}