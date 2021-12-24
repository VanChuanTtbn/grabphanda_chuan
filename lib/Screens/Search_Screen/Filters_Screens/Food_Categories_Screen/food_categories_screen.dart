import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Food_Categories_Screen/food_categories_controller.dart';

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
        child: Container(
          height: 1000,
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index){
                return Stack(
                  children: [
                    Container(
                      child: CheckboxListTile(
                        checkColor: Colors.white,
                        title: Text('${controller.listFoodCategories![index].type}', style: GoogleFonts.poppins(),),
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