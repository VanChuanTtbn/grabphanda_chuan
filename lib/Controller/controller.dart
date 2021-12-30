import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grabpanda1/Models/Entity/account_entity.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';
import 'package:grabpanda1/Screens/Home_Screen/home_screen.dart';
import 'package:grabpanda1/Screens/Login_Screen/login_screen.dart';

class BaseController extends GetxController {

  EmailAuth? emailAuth;
  final getStorage = GetStorage();

  // BaseController() {
  //   emailAuth = EmailAuth(
  //     sessionName: "Sample session",
  //   );
  // }
  Future<void> initStorage() async {

  }

  void storeAccountEntity(AccountEntity model) {
    getStorage.write('auth', model.toMap());
  }

  AccountEntity restoreModel() {
    final map = getStorage.read('auth') ?? {};
    return AccountEntity.fromMap(map);
  }




  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.userChanges());
  }

  Future<String?> getName() async {
    String? getName = (await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get())
        .data()?['name']
        .toString();
    return getName;
  }

  Future<String?> getLocation() async {
    String? getLocation = (await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get())
        .data()?['location']
        .toString();
    return getLocation;
  }

  void signOut() async {
    await auth.signOut();
    // Get.offAll(LoginScreen());
  }
}
