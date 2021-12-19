import 'dart:core';
import 'package:email_auth/email_auth.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Models/Entity/user_entity.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class BaseController extends GetxController {
  List<UserEntity>? listUser;
  EmailAuth? emailAuth;
  late String getEmail;
  late String getName;
  late String getLocation;
  late String getPhoneNumber;



  List<UserEntity>? get listAccount => listUser;

  BaseController() {
    emailAuth = EmailAuth(
      sessionName: "Sample session",
    );
  }

  getListUser() async {
    var box = await Hive.openBox<UserEntity>('userEntity');
    listUser = box.values.toList();
  }

  Future<bool>? addUser(UserEntity user) async {
    var box = await Hive.openBox<UserEntity>('userEntity');
    final isCheck = checkUser(user);
    if (isCheck == true) {
      box.put('${Uuid.NAMESPACE_DNS}', user);
      listUser!.add(user);
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool>? checkUser(UserEntity user) async {
    var box = await Hive.openBox<UserEntity>('userEntity');
    await getListUser();
    if (listUser != null) {
      for (int i = 0; i < listUser!.length; i++) {
        if (user.email == listUser![i].email) {
          return false;
        }
      }
      box.put('${Uuid.NAMESPACE_DNS}', user);
      listUser!.add(user);
      update();
      return true;
    } else {
      box.put('${Uuid.NAMESPACE_DNS}', user);
      listUser!.add(user);
      update();
      return true;
    }
  }

  Future<bool>? login({String? email, String? password}) async {
    await getListUser();
    try {
      if (listUser != null) {
        for (int i = 0; i < listUser!.length; i++) {
          if (email == listUser![i].email) {
            if (password == listUser![i].password) {
              getEmail = email!;
              getLocation = listUser![i].location!;
              getName = listUser![i].name!;
              getPhoneNumber = listUser![i].phoneNumber!;
              return true;
            } else {
              return false;
            }
          }
        }
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendOTP({email}) async {
    final result = await emailAuth!.sendOtp(recipientMail: email, otpLength: 5);
    if (result) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> veryfiOTP({otp}) async {
    final result =
        await emailAuth!.validateOtp(recipientMail: getEmail, userOtp: otp);
    if (result) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool>? changePassword({String? rePassword, String? password}) async {
    var box = await Hive.openBox<UserEntity>('userEntity');
    await getListUser();
    try {
      if (listUser != null) {
        for (int i = 0; i < listUser!.length; i++) {
          if (getEmail == listUser![i].email) {
            if (password == rePassword) {
              await box.putAt(i, UserEntity(
                email: getEmail,
                name: getName,
                phoneNumber: getPhoneNumber,
                location: getPhoneNumber,
                password: password,
              ));
              update();
              return true;
            } else {
              return false;
            }
          }
        }
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
