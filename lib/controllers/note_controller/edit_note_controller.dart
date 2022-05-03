import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/helpers/network_helper.dart';
import 'package:note_app_with_api/models/note_model.dart';
import 'package:http/http.dart' as http;

import '../home_controller.dart';

class EditNoteController extends GetxController {
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

  Future<void> editNote(NoteModel note) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (image == null) {
      return;
    }

    http.Response response = await NetworkHelper.postWithImage(
      url: NOTE_UPDATE,
      image: image,
      body: {
        "title": title,
        "content": content,
        "noteid": note.id.toString(),
        "oldimage": note.image,
      },
    );
    if (jsonDecode(response.body)["status"] == "success") {
      Get.find<HomeController>().getData();
      Get.back();
    }
  }
}
