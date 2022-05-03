import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:note_app_with_api/components/alert.dart';
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/constants/variable_const.dart';
import 'package:note_app_with_api/helpers/catch_helper.dart';
import 'package:note_app_with_api/helpers/network_helper.dart';
import 'package:note_app_with_api/screens/home/home_screen.dart';

class LoginController extends GetxController {
  String email = "";
  String password = "";
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    http.Response response = await NetworkHelper.post(
      url: LOGIN_URL,
      body: {
        "email": email,
        "pass": password,
      },
    );

    var data = jsonDecode(response.body);

    if (data["status"] == "success") {
      // Save user data
      CatchHelper.instance.save(k_userData, jsonEncode(data["data"]));

      // Navigate
      Get.off(() => HomeScreen());
    } else {
      Get.dialog(
        Alert(message: "Something is wrong!!\nPlease insert different info"),
      );
    }
    print(data);
  }
}
