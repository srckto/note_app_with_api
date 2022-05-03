import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_api/components/build_note.dart';
import 'package:note_app_with_api/components/custom_text.dart';
import 'package:note_app_with_api/controllers/home_controller.dart';
import 'package:note_app_with_api/screens/note/add_note.dart';
import 'package:note_app_with_api/screens/note/edit_note.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.logOut();
            },
            child: CustomText(text: "LogOut"),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            if (controller.notes.isEmpty) {
              return Center(child: CustomText(text: "There aren't notes"));
            }
            return ListView.separated(
              itemCount: controller.notes.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 0);
              },
              itemBuilder: (BuildContext context, int index) {
                return BuildNote(
                  model: controller.notes[index],
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNote());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
