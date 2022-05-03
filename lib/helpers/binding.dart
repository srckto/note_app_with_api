


import 'package:get/get.dart';
import 'package:note_app_with_api/controllers/home_controller.dart';
import 'package:note_app_with_api/controllers/login_contoller.dart';
import 'package:note_app_with_api/controllers/note_controller/add_note_controller.dart';
import 'package:note_app_with_api/controllers/signup_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController() , fenix: true);
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AddNoteController());
  }
}