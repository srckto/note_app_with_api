import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_with_api/components/custom_button.dart';
import 'package:note_app_with_api/components/custom_field.dart';
import 'package:note_app_with_api/controllers/note_controller/add_note_controller.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AddNoteController>(
          init: AddNoteController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomField(
                      hintText: "Title",
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return "The title must be greater than 4";
                        }
                      },
                      onChanged: (value) {
                        controller.title = value;
                      },
                      maxLines: 1,
                    ),
                    SizedBox(height: 30),
                    CustomField(
                      hintText: "Content",
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return "The content must be greater than 4";
                        }
                      },
                      onChanged: (value) {
                        controller.content = value;
                      },
                      maxLines: 5,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      color: controller.image == null ? Colors.blue : Colors.green,
                      text: "Choose Image",
                      onPressed: () async {
                        await controller.chooseImage();
                      },
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      onPressed: () {
                        controller.addNote();
                      },
                      text: "Add Note",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
