import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Commons/app_img.dart';
import 'package:grabpanda1/Screens/Login_Screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void initState() {
    // _navigateLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AppImg.imgLogo,
              height: 177,
              width: 163,
            ),
            const SizedBox(height: 20.0),
            Text(
              "GrabPanda",
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width > 370 ? 22 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Center(
              child: Container(
                width: 50,
                height: 50,
                child: const CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  // void _navigateLoginPage() async {
  //    Timer(const Duration(seconds: 2), () => Get.off(LoginScreen()));
  // }
}
