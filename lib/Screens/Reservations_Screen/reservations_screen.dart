import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Screens/Reset_Password/Reset_Email/reset_email_screen.dart';
import 'package:grabpanda1/Screens/Search_Location/search_loaction_screen.dart';

class ReservationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseController());
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(ResetEmailScreen());
              },
              child: const Text("Change Password"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SearchLocationScreen());
              },
              child: const Text("Search Loaction"),
            ),
            ElevatedButton(
              onPressed: () async {
                controller.signOut();
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
