import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:note_app_with_api/components/custom_text.dart';
import 'package:note_app_with_api/constants/network_url.dart';
import 'package:note_app_with_api/controllers/note_controller/delete_note_controller.dart';
import 'package:note_app_with_api/models/note_model.dart';
import 'package:note_app_with_api/screens/note/edit_note.dart';

class BuildNote extends StatelessWidget {
  final NoteModel model;
  const BuildNote({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          width: Get.width,
          height: 130,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.to(() => EditNote(model: model)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                          "$IMAGE_URL/${model.image}",
                          width: 110,
                          height: 100,
                          cacheHeight: 100,
                          cacheWidth: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: model.title!,
                              maxLine: 1,
                              fontSized: 20,
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text: model.content!,
                              maxLine: 3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<DeleteNoteController>(
                init: DeleteNoteController(),
                builder: (controller) {
                  return IconButton(
                    onPressed: () {
                      controller.deleteNote(model);
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
