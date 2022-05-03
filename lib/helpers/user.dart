import 'dart:convert';

import 'package:note_app_with_api/constants/variable_const.dart';
import 'package:note_app_with_api/helpers/catch_helper.dart';
import 'package:note_app_with_api/models/user_model.dart';

class User {
  User._privateConstructor();

  static final User instance = User._privateConstructor();

  UserModel? get model {
    return _model == null ? init() : _model;
  }

  void set model(UserModel? data) {
    _model = data;
  }

  UserModel? _model;

  UserModel? init() {
    try {
      var data = CatchHelper.instance.get(k_userData);
      if (data == null) {
        return null;
      }
      _model = UserModel.fromJson(jsonDecode(data));
      return _model;
    } catch (e) {
      print(e.toString());
    }
  }
}
