import 'dart:convert';

import 'package:get/get.dart';
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/controllers/home_controller.dart';
import 'package:note_app_with_api/helpers/network_helper.dart';
import 'package:note_app_with_api/models/note_model.dart';
import 'package:http/http.dart' as http;

class DeleteNoteController extends GetxController {
  Future<void> deleteNote(NoteModel model) async {
    http.Response response = await NetworkHelper.post(
      url: NOTE_DELETE,
      body: {
        "noteid": model.id!.toString(),
        "imagename": model.image,
      },
    );

    if (jsonDecode(response.body)["status"] == "success") {
      Get.find<HomeController>().notes.remove(model);
      Get.find<HomeController>().update();
    }
  }
}
