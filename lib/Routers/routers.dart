import 'package:get/get.dart';
import 'package:grabpanda/Routers/routers_name.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen.dart';
import 'package:grabpanda/Screens/Register_Screen/register_screen.dart';
import 'package:grabpanda/Screens/Splash/splash_screen.dart';
import 'package:fluro/fluro.dart';

class Routers {
  static List<GetPage> pages() {
    return [
      GetPage(
          name: RoutersName.root,
          page: () => Splash(),
      ),
      GetPage(
          name: RoutersName.login,
          page: () => LoginScreen(),
      ),
      GetPage(
        name: RoutersName.register,
        page: () => RegisterScreen(),
      ),
    ];
  }
}