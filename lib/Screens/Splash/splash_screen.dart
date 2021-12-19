import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  void initState() {
    _navigateLoginPage();
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
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  void _navigateLoginPage() async {
     await Timer(const Duration(seconds: 2), () => Get.off(LoginScreen()));
  }
}
