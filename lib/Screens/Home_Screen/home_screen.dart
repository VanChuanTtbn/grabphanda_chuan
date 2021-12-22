import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Email/reset_email_screen.dart';
import 'package:grabpanda/Screens/Search_Location/search_loaction_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text("Xin Chao: ${controller.restoreModel().email}"),
            ElevatedButton(
              onPressed: () {
                Get.to(ResetEmailScreen());
              },
              child: Text("Change Password"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SearchLocationScreen());
              },
              child: Text("Search Location"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Text("logout"),
            ),
          ],
        ),
      ),
    );
  }
}
