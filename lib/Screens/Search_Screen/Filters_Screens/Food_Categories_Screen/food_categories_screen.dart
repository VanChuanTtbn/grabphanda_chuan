import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'food_categories_controller.dart';

class FoodCategoriesScreen extends StatefulWidget{
  @override
  State<FoodCategoriesScreen> createState() => _FoodCategoriesScreenState();
}

class _FoodCategoriesScreenState extends State<FoodCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodCategoriesController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 10000,
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index){
                return Stack(
                  children: [
                    Container(
                      child: CheckboxListTile(
                        checkColor: Colors.white,
                        title: Text('${controller.listFoodCategories![index].type}', style: Theme.of(context).textTheme.bodyText1,),
                        value: controller.listFoodCategories![index].checkFoodCategories,
                        onChanged: (bool? value){
                          setState(() {
                            controller.listFoodCategories![index].checkFoodCategories = value;
                          });
                        },
                      )
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index){
                return const SizedBox(
                  height: 0,
                );
              },
              itemCount: controller.listFoodCategories!.length,
          ),
        ),
      ),
    );
  }
}