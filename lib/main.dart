import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app_with_api/helpers/binding.dart';
import 'package:note_app_with_api/helpers/user.dart';
import 'package:note_app_with_api/screens/auth/login_screen.dart';
import 'package:note_app_with_api/screens/home/home_screen.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: User.instance.model == null ? LoginScreen() : HomeScreen(),
    );
  }
}
