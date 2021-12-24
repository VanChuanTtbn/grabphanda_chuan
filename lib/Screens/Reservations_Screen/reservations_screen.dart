import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Email/reset_email_screen.dart';
import 'package:grabpanda/Screens/Search_Location/search_loaction_screen.dart';

class ReservationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
