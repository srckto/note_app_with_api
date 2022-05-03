import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/controllers/home_controller.dart';
import 'package:note_app_with_api/helpers/network_helper.dart';
import 'package:note_app_with_api/helpers/user.dart';
import 'package:http/http.dart' as http;

class AddNoteController extends GetxController {
  String title = "";
  String content = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;

  Future<void> chooseImage() async {
    XFile? imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicker != null) {
      image = File(imagePicker.path);
      update();
    }
  }

  

  Future<void> addNote() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (image == null) {
      return;
    }

    try {
      http.Response response = await NetworkHelper.postWithImage(
        url: NOTE_ADD,
        image: image,
        body: {
          "title": title,
          "content": content,
          "userid": User.instance.model!.id.toString(),
        },
      );
      if (jsonDecode(response.body)["status"] == "success") {
        Get.find<HomeController>().getData();
        Get.back();
      } else {
        print("Error");
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
