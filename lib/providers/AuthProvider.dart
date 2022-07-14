import 'package:flutter/material.dart';
import 'package:flutter_expenses/services/api.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  ApiService apiService = new ApiService();

  AuthProvider();

  Future<String> register(String name, String email, String password, String passwordConfirm, String deviceName) async {
    String token = await apiService.register(name, email, password, passwordConfirm, deviceName);
    isAuthenticated = true;
    notifyListeners();

    return token;
  }
}