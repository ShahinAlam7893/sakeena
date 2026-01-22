import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _resetEmail;
  String? get resetEmail => _resetEmail;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    setLoading(true);
    clearError();

    try {
      // TODO: Replace with real auth service
      await Future.delayed(const Duration(seconds: 1)); // simulate network
      onSuccess();
    } catch (e) {
      setError('Login failed: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    setLoading(true);
    clearError();

    try {
      // TODO: Replace with real auth service
      await Future.delayed(const Duration(seconds: 1));
      onSuccess();
    } catch (e) {
      setError('Signup failed: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  Future<void> sendResetCode({
    required String email,
    required VoidCallback onSuccess,
  }) async {
    setLoading(true);
    clearError();

    try {
      // TODO: Replace with real auth service
      await Future.delayed(const Duration(seconds: 1));
      _resetEmail = email;
      notifyListeners();
      onSuccess();
    } catch (e) {
      setError('Failed to send code: ${e.toString()}');
    } finally {
      setLoading(false);
    }
  }

  Future<void> verifyOtp({
    required String otp,
    required VoidCallback onSuccess,
  }) async {
    setLoading(true);
    clearError();

    try {
      // TODO: Replace with real verification
      await Future.delayed(const Duration(seconds: 1));
      if (otp.length == 5) {
        onSuccess();
      } else {
        setError('Invalid OTP');
      }
    } catch (e) {
      setError('Verification failed');
    } finally {
      setLoading(false);
    }
  }

  Future<void> resetPassword({
    required String newPassword,
    required VoidCallback onSuccess,
  }) async {
    setLoading(true);
    clearError();

    try {
      // TODO: Replace with real password reset
      await Future.delayed(const Duration(seconds: 1));
      onSuccess();
    } catch (e) {
      setError('Password reset failed');
    } finally {
      setLoading(false);
    }
  }
}