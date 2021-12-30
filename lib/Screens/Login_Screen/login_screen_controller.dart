

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';

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


  Future<void>? login(String? email, String? password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email!, password: password!);
      // Get.offAll(BottomBarScreen());
    }catch(e){
      Get.snackbar("About User", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: const Text("Account Login Failed", style: TextStyle(
          color: Colors.white,
        )),
        messageText: Text(e.toString(),
            style: const TextStyle(
              color: Colors.white,
            )),
      );
    }
  }
}
