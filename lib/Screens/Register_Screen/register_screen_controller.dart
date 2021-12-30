import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/account_entity.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';

class RegisterScreenController extends BaseController {
  Future<bool>? checkAccount(AccountEntity user) async {
    print(restoreModel());
    await restoreModel();
    if (restoreModel() != null) {
      if (user.email == restoreModel().email) {
        return false;
      } else {
        storeAccountEntity(user);
        update();
        return true;
      }
    } else {
      storeAccountEntity(user);
      update();
      return true;
    }
  }

  Future<void>? register(AccountEntity user) async{
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!)
          .then((value) => {
                FirebaseFirestore.instance
                    .collection('user')
                    .doc(value.user!.uid)
                    .set({
                  "email": value.user!.email,
                  "name": user.name,
                  "location": user.location,
                  "phoneNumber": user.phoneNumber,
                })
              });
      // Get.offAll(BottomBarScreen());
    } catch (e) {
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.TOP,
        titleText: const Text("Account Creation Failed", style: TextStyle(
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
