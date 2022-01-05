import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Filters_Screen/filters_controller.dart';

import 'location_controller.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final filtersController = Get.put(FiltersController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 10000,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                color: filtersController.selectValue == index ? Colors.blue : Colors.white,
                child: ListTile(
                  onTap: (){
                    setState(() {
                      filtersController.selectValue = index;
                      // filtersController.getCountLoca();
                      // Navigator.pop(context);
                    });
                  },
                  title: Stack(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${filtersController.listLocation![index].location}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: filtersController.listLocation!.length,
          ),
        ),
      ),
    );
  }
}
