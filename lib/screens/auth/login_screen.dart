import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_api/components/custom_button.dart';
import 'package:note_app_with_api/components/custom_field.dart';
import 'package:note_app_with_api/components/custom_text.dart';
import 'package:note_app_with_api/controllers/login_contoller.dart';
import 'package:note_app_with_api/screens/auth/singup_screen.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  onChanged: (value) {
                    controller.email = value;
                  },
                  hintText: "email",
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "The field is empty";
                    }
                    if (value.length < 6) {
                      return "Email is short";
                    }
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
                      return "The field is empty";
                    }
                    if (value.length < 6) {
                      return "Password is short";
                    }
                  },
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    controller.login();
                  },
                ),
                TextButton(
                  onPressed: () => Get.off(() => SignUpScreen()),
                  child: CustomText(
                    text: "Sign up",
                    fontSized: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
