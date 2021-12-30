import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';
import 'package:grabpanda1/Screens/Login_Screen/login_screen.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if(user == null){
      Get.offAll(() => LoginScreen());
    }else{
      Get.offAll(() => BottomBarScreen());
    }
  }
}