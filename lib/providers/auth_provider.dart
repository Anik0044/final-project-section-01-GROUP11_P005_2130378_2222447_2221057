import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userName;

  bool get isLoggedIn => _isLoggedIn;
  String? get userName => _userName;

  // Simple login without Firebase
  void login(String email, String password) {
    if (email == 'test@example.com' && password == '123456') {
      _isLoggedIn = true;
      _userName = 'Test User';
      notifyListeners();
    }
  }

  // Simple signup
  void signup(String name, String email, String password) {
    _isLoggedIn = true;
    _userName = name;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userName = null;
    notifyListeners();
  }
}