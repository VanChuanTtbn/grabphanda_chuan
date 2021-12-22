import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';

class LoginScreenController extends BaseController {
  Future<bool>? signin({String? email, String? password}) async {
    await restoreModel();
    try {
      if (restoreModel() != null) {
        if (email == restoreModel().email) {
          if (password == restoreModel().password) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
