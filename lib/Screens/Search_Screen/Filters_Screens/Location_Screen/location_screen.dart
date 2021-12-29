import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'location_controller.dart';

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
                Text("${controller.listLocation![index].location}", style: Theme.of(context).textTheme.bodyText1,),
              ],
            );
            },
            separatorBuilder: (context, index){
              return SizedBox(
                height: Get.height * 0.01,
              );
            },
            itemCount: controller.listLocation!.length,
        ),
      ),
    );
  }
}