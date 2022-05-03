import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/constants/variable_const.dart';
import 'package:note_app_with_api/helpers/catch_helper.dart';
import 'package:note_app_with_api/helpers/network_helper.dart';
import 'package:note_app_with_api/helpers/user.dart';
import 'package:note_app_with_api/models/note_model.dart';
import 'package:note_app_with_api/screens/auth/login_screen.dart';

class HomeController extends GetxController {
  onInit() async {
    super.onInit();
    await getData();
    update();
  }

  

  List<NoteModel> notes = [];

  Future<void> logOut() async {
    await CatchHelper.instance.remove(k_userData);
    User.instance.model = null;
    Get.off(() => LoginScreen());
  }

  Future<void> getData() async {
    try {
      http.Response response = await NetworkHelper.post(
        url: NOTE_GET,
        body: {"userid": User.instance.model!.id.toString()},
      );

      if (response.statusCode == 200) {
        notes = [];
        List data = jsonDecode(response.body)["data"] as List;

        for (var i = 0; i < data.length; i++) {
          notes.add(NoteModel.fromJson(data[i]));
        }
        update();
        print(notes);
      }
    } catch (e) {
      print("Error in get notes : ${e.toString()}");
    }
  }
}
