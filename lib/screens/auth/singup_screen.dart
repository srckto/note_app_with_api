import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_api/components/custom_button.dart';
import 'package:note_app_with_api/components/custom_field.dart';
import 'package:note_app_with_api/components/custom_text.dart';
import 'package:note_app_with_api/controllers/signup_controller.dart';
import 'package:note_app_with_api/screens/auth/login_screen.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Note App",
                    fontSized: 40,
                    color: Colors.red,
                  ),
                  SizedBox(height: 30),
                  CustomField(
                    hintText: "username",
                    onChanged: (value) {
                      controller.username = value;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return " The field is empty";
                      }
                      if (value.length < 6) {
                        return "The username is short";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomField(
                    onChanged: (value) {
                      controller.email = value;
                    },
                    hintText: "email",
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return " The field is empty";
                      }
                      if (value.length < 6) {
                        return "The email is short";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomField(
                    onChanged: (value) {
                      controller.password = value;
                    },
                    hintText: "password",
                    obscureText: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return " The field is empty";
                      }
                      if (value.length < 6) {
                        return "The password is short";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomField(
                    onChanged: (value) {
                      controller.rePassword = value;
                    },
                    hintText: "confirm password",
                    obscureText: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return " The field is empty";
                      }
                      if (value.length < 6) {
                        return "The password is short";
                      }
                      if (controller.password != controller.rePassword) {
                        return "The password doesn't match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      controller.singUp();
                    },
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => LoginScreen()),
                    child: CustomText(
                      text: "LogIn",
                      fontSized: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
