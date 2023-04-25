import 'package:flutter/material.dart';
import 'package:serpismotor2/models/user_model.dart';
import 'package:serpismotor2/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {String? name, String? username, String? email, String? password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String? email, String? password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout({UserModel? user}) async {
    try {
      await AuthService().logout(user: user);
      _user = null;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> updateProfile({
    UserModel? user,
    String? name,
    String? username,
    String? email,
  }) async {
    try {
      await AuthService().updateProfile(
        user: user,
        name: name,
        username: username,
        email: email,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
