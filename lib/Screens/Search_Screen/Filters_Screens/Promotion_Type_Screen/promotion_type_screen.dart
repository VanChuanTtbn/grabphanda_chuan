import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Food_Categories_Screen/food_categories_controller.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Promotion_Type_Screen/promotion_type_controller.dart';

class PromotionTypeScreen extends StatefulWidget{
  @override
  State<PromotionTypeScreen> createState() => _PromotionTypeScreenState();
}

class _PromotionTypeScreenState extends State<PromotionTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PromotionTypeController());
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
                        title: Text('${controller.listPromotionType![index].promotionType}', style: GoogleFonts.poppins(),),
                        value: controller.listPromotionType![index].checkFoodCategories,
                        onChanged: (bool? value){
                          setState(() {
                            controller.listPromotionType![index].checkFoodCategories = value;
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
            itemCount: controller.listPromotionType!.length,
          ),
        ),
      ),
    );
  }
}