import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/login_page.dart';
import 'dart:developer';
import 'constants.dart';

class ApiService {
  String? token;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
      var response = await http.post(url,
          body: ({'username': username, 'password': password}));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        token = data['access_token'];
        // //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        //    var status = true,
        //
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateUserData({
    String? username,
    String? newPassword,
    String? currentPassword,
    String? email,
    String? phoneNumber,
    String? gender,
  }) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
      var response = await http.post(url,
          body: ({
            'username': username,
            'email': email,
            'phone_number': phoneNumber,
            'current_password': currentPassword,
            'new-password': newPassword
          }));
    } catch (e) {
      log(e.toString());
    }
  }
}
