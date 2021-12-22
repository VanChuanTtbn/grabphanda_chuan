import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Models/Entity/account_entity.dart';

class ResetPasswordController extends BaseController {
  Future<bool>? changePassword({String? rePassword, String? password}) async {
    await restoreModel();
    try {
      if (restoreModel() != null) {
        if (password == rePassword) {
          storeAccountEntity(AccountEntity(
            email: restoreModel().email,
            name: restoreModel().name,
            phoneNumber: restoreModel().phoneNumber,
            location: restoreModel().location,
            password: password,
          ));
          update();
          return true;
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
