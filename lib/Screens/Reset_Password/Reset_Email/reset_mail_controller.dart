import 'package:grabpanda/Controller/controller.dart';

class ResetEmailController extends BaseController{

  Future<bool> sendOTP({email}) async {
    final result = await emailAuth!.sendOtp(recipientMail: email, otpLength: 6);
    if (result) {
      return true;
    } else {
      return false;
    }
  }
}