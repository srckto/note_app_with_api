class NoteModel {
  int? id;
  String? title;
  String? content;
  String? image;
  int? userId;

  NoteModel({this.id, this.title, this.content, this.image, this.userId});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['notes_id'];
    title = json['notes_title'];
    content = json['notes_content'];
    image = json['notes_image'];
    userId = json['notes_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_id'] = this.id;
    data['notes_title'] = this.title;
    data['notes_content'] = this.content;
    data['notes_image'] = this.image;
    data['notes_user'] = this.userId;
    return data;
  }
}
