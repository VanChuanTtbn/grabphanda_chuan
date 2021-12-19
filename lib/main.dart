// @dart=2.9
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Models/Entity/user_entity.dart';
import 'package:grabpanda/Routers/routers.dart';
import 'package:grabpanda/Routers/routers_name.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen.dart';
import 'package:grabpanda/Screens/Splash/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir =  await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter<UserEntity>(UserEntityAdapter());
  await Hive.openBox<UserEntity>('userEntity');
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0),
    ),
  );
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
