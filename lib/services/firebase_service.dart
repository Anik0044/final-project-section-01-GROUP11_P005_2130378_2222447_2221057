// Simple Firebase Mock Service
class FirebaseService {
  static bool isInitialized = false;

  // Mock initialization
  static Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    isInitialized = true;
    print('Firebase Service Initialized (Mock)');
  }

  // Mock login
  static Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    // Simple validation
    if (email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }

  // Mock signup
  static Future<bool> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }

  // Mock expense operations
  static Future<List<Map<String, dynamic>>> getExpenses() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        'id': '1',
        'description': 'Sample Expense 1',
        'amount': 25.50,
        'category': 'Food',
        'date': DateTime.now().toIso8601String(),
      },
      {
        'id': '2',
        'description': 'Sample Expense 2',
        'amount': 15.00,
        'category': 'Transport',
        'date': DateTime.now().toIso8601String(),
      },
    ];
  }

  static Future<bool> addExpense(Map<String, dynamic> expenseData) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  static Future<bool> updateExpense(String id, Map<String, dynamic> expenseData) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  static Future<bool> deleteExpense(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  // Mock logout
  static Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    isInitialized = false;
  }
}