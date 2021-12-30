

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';

class LoginScreenController extends BaseController {

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
