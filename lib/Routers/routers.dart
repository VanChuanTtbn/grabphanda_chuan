import 'package:get/get.dart';
import 'package:fluro/fluro.dart';
import 'package:grabpanda1/Routers/routers_name.dart';
import 'package:grabpanda1/Screens/Login_Screen/login_screen.dart';
import 'package:grabpanda1/Screens/Register_Screen/register_screen.dart';
import 'package:grabpanda1/Screens/Splash/splash_screen.dart';

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