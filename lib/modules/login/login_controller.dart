import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  String? username = '';
  String? password = '';
  var _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    onUpdate();
  }

  var _error = "";
  String get error => _error;
  set error(String value) {
    _error = value;
    onUpdate();
  }

  var isLogged = false;
  final formKey = GlobalKey<FormState>();
  final VoidCallback onSuccessLogin;
  final VoidCallback onUpdate;

  LoginController({
    required this.onSuccessLogin,
    required this.onUpdate,
  });

  void login() async {
    try {
      isLoading = true;
      final response = await apiLogin(username: username!, password: password!);
      isLoading = false;
      if (response) {
        onSuccessLogin();
      }
    } catch (e) {
      isLoading = false;
      error = "Não foi possível fazer login";
    }
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? validateUsername(String? username) {
    return username != null && username.isNotEmpty
        ? null
        : 'O usuário não pode estar vazio';
  }

  String? validatePassword(String? password) {
    return password != null && password.length >= 6
        ? null
        : 'A senha precisa ter no mínimo 6 caracteres';
  }

  Future<bool> apiLogin({
    required String username,
    required String password,
  }) async {
    final response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
    print(response);
    return true;
  }
}
