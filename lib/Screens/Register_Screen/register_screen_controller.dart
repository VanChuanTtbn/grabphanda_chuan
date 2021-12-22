import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Models/Entity/account_entity.dart';

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
}
