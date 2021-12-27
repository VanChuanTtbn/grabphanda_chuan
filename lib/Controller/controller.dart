import 'dart:core';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grabpanda/Models/Entity/account_entity.dart';

class BaseController extends GetxController {
  EmailAuth? emailAuth;
  final getStorage = GetStorage();

  BaseController() {
    emailAuth = EmailAuth(
      sessionName: "Sample session",
    );
  }
  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void storeAccountEntity(AccountEntity model) {
    getStorage.write('auth', model.toMap());
  }

  AccountEntity restoreModel() {
    final map = getStorage.read('auth') ?? {};
    return  AccountEntity.fromMap(map);
  }
}
