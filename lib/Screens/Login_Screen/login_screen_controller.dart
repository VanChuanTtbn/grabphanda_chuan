

import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/account_entity.dart';

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


  Future<void>? login(String? email, String? password){
    try{
      auth.signInWithEmailAndPassword(email: email!, password: password!);
    }catch(e){
      print(e.toString());
    }
  }
}
