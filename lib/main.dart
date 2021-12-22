// @dart=2.9
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Routers/routers.dart';
import 'package:grabpanda/Routers/routers_name.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0),
    ),
  );
  await Get.put(BaseController()).initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
