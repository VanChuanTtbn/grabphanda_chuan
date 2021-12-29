

import 'package:grabpanda1/Controller/controller.dart';

class VerifyController extends BaseController{

  Future<bool> veryfiOTP({otp}) async {
    await restoreModel();
    final result =
    await emailAuth!.validateOtp(recipientMail: restoreModel().email!, userOtp: otp);
    if (result) {
      return true;
    } else {
      return false;
    }
  }
}