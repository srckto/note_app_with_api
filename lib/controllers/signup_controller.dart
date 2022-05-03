import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:note_app_with_api/components/alert.dart';
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/helpers/network_helper.dart';

class SignUpController extends GetxController {
  String username = "";
  String email = "";
  String password = "";
  String rePassword = "";
  GlobalKey<FormState> formKey = GlobalKey();

  Future singUp() async {
    // Check validate
    if (!formKey.currentState!.validate()) {
      return;
    }

    http.Response response = await NetworkHelper.post(
      url: SIGNUP_URL,
      body: {
        "username": username,
        "email": email,
        "pass": password,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data["status"] == "success") {
        Get.dialog(
          Alert(message: "Success Sign up \nPlease return and login"),
        );
      } else {
        Get.dialog(
          Alert(message: "Something is wrong!!\nPlease insert different info"),
        );
      }
      print(data);
    }
  }
}
