import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String? _userEmail;
  String? get userEmail => _userEmail;

  String? _tempResetEmail;
  String? get tempResetEmail => _tempResetEmail;

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _isLoggedIn = true;
    _userEmail = email;
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _isLoggedIn = true;
    _userEmail = email;
    notifyListeners();
  }

  void setTempResetEmail(String email) {
    _tempResetEmail = email;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userEmail = null;
    _tempResetEmail = null;
    notifyListeners();
  }
}