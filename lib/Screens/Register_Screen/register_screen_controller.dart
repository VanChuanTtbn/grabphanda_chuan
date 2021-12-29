import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/account_entity.dart';

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

  Future<void>? register(AccountEntity user) {
    try {
      auth
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
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e.toString());
    }
  }
}
