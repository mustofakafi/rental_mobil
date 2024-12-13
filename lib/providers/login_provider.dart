import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    const url = 'https://latihan-json.aksi-pintar.com/api/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData['status'] == 'success') {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString(
              'userName',
              responseData['data']['nama'] ??
                  ''); // Simpan nama pengguna jika ada
          await prefs.setString(
              'userPhoto',
              responseData['data']['photo'] ??
                  ''); // Simpan foto pengguna jika ada

          notifyListeners();
          return true;
        } else {
          _errorMessage = responseData['message']['error'] ?? 'Login gagal';
          notifyListeners();
          return false;
        }
      } else if (response.statusCode == 401) {
        _errorMessage = responseData['message']['error'] ?? 'Unauthorized';
        notifyListeners();
        return false;
      } else {
        _errorMessage = 'Server error: ${response.statusCode}';
        notifyListeners();
        return false;
      }
    } catch (error) {
      _errorMessage = 'Terjadi kesalahan: $error';
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
