import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Routers/routers.dart';
import 'package:grabpanda1/Screens/Splash/splash_screen.dart';

import 'Controller/auth_controller.dart';
import 'Routers/routers_name.dart';
import 'Screens/Login_Screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> firebaseApp = Firebase.initializeApp();
  firebaseApp.then((value) => {
  Get.put(AuthController()),
    // Get.put(BaseController()),
  });
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
