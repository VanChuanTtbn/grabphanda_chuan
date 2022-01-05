import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Filters_Screen/filters_controller.dart';

import 'food_categories_controller.dart';

class FoodCategoriesScreen extends StatefulWidget {
  @override
  State<FoodCategoriesScreen> createState() => _FoodCategoriesScreenState();
}

class _FoodCategoriesScreenState extends State<FoodCategoriesScreen> {
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
              return Stack(
                children: [
                  Container(
                      child: CheckboxListTile(
                    checkColor: Colors.white,
                    title: Text(
                      '${filtersController.listFoodCategories![index].type}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    value: filtersController
                        .listFoodCategories![index].checkFoodCategories,
                    onChanged: (bool? value) {
                      setState(() {
                        filtersController.listFoodCategories![index]
                            .checkFoodCategories = value;
                      });
                    },
                  )),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemCount: filtersController.listFoodCategories!.length,
          ),
        ),
      ),
    );
  }
}
