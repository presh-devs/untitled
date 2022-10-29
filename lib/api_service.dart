import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';
import 'constants.dart';

class LoginResponse {
  final int apiStatus;
  final String? timezone;
  final String? accessToken;
  final String? userId;
  final bool? membership;
  final ErrorBody? error;

  LoginResponse(
      {required this.apiStatus,
      this.timezone,
      this.accessToken,
      this.userId,
      this.membership,
      this.error});
}

class ErrorBody {
  final String? errorId;
  final String? errorText;

  ErrorBody({this.errorId, this.errorText});
}

class ApiService {
  Future<LoginResponse?> login({
    required String username,
    required String password,
  }) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
      var response = await http.post(url,
          body: ({
            'username': username,
            'password': password,
            'server_key': ApiConstants.serverKey,
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data['api_status'] == 200) {
          LoginResponse loginResponse = LoginResponse(
            apiStatus: data['api_status'],
            userId: data['user_id'],
            membership: data['membership'],
            timezone: data['timezone'],
            accessToken: data['access_token'],
          );
          return loginResponse;
        } else {
          LoginResponse loginResponse = LoginResponse(
            apiStatus: data['api_status'],
            error: data['errors'],
          );
          return loginResponse;
        }
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> updateUserData({
    String? username,
    String? newPassword,
    String? currentPassword,
    String? email,
    String? phoneNumber,
    String? gender,
    required String token,
  }) async {
    try {
      final queryParameters = {
        'access_token': token,
      };
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.updateUserData)
          .replace(queryParameters: queryParameters);
      var response = await http.post(url,
          body: ({
            'server_key': ApiConstants.serverKey,
            'username': username,
            'email': email,
            'phone_number': phoneNumber,
            'current_password': currentPassword,
            'new_password': newPassword,
            'gender': gender,
          }));

      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['message']);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
