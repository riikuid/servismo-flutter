import 'dart:convert';

import 'package:serpismotor2/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:serpismotor2/providers/auth_provider.dart';

class AuthService {
  String baseUrl = 'http://dashboard.servismo.me/api';

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      if (data['access_token'] != null) {
        user.token = 'Bearer ${data['access_token']}';
      } else {
        user.token = 'Invalid Token';
      }

      return user;
    } else {
      throw Exception('Failed to register user.');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'email': email, 'password': password});
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      if (data['access_token'] != null) {
        user.token = 'Bearer ${data['access_token']}';
      } else {
        user.token = 'Invalid Token';
      }

      return user;
    } else {
      throw Exception('Failed to register user.');
    }
  }

  Future<void> logout({UserModel? user}) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': user!.token!,
    };

    final response = await http.post(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      // clear user token
      user.token = null;
      print('Success logout');
    } else {
      throw Exception('Failed to logout user.');
    }
  }

  Future<UserModel> updateProfile({
    UserModel? user,
    String? name,
    String? username,
    String? email,
  }) async {
    var url = '$baseUrl/user';
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
    });
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': user!.token!,
    };
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print('$name dan $email');
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      print("Success Update Profile");
      return user;
    } else {
      throw Exception('Failed to update user profile.');
    }
  }
}
