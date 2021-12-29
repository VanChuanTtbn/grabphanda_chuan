import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Routers/routers.dart';

import 'Routers/routers_name.dart';
import 'Screens/Login_Screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> firebaseApp = Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0),
    ),
  );
  firebaseApp.then((value) => {
  Get.put(BaseController()),
  });
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
      initialRoute: RoutersName.root,
      getPages: Routers.pages(),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/img/logo_grabpanda.png',),
        nextScreen: LoginScreen(),
        duration: 2000,
      ),
    );
  }
}
