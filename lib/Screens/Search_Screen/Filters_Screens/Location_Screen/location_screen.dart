import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Location_Screen/location_controller.dart';

class LocationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
            itemBuilder: (context, index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle_outline, size: 10,),
                const SizedBox(width: 10,),
                Text("${controller.listLocation![index].location}", style: GoogleFonts.poppins(),),
              ],
            );
            },
            separatorBuilder: (context, index){
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: controller.listLocation!.length,
        ),
      ),
    );
  }
}