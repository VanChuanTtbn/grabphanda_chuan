import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Filters_Screen/filters_controller.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Promotion_Type_Screen/promotion_type_controller.dart';

class PromotionTypeScreen extends StatefulWidget{
  @override
  State<PromotionTypeScreen> createState() => _PromotionTypeScreenState();
}

class _PromotionTypeScreenState extends State<PromotionTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final filtersController = Get.put(FiltersController());
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
                        title: Text('${filtersController.listPromotionType![index].promotionType}%', style: Theme.of(context).textTheme.bodyText1,),
                        value: filtersController.listPromotionType![index].checkPromo,
                        onChanged: (bool? value){
                          setState(() {
                            filtersController.listPromotionType![index].checkPromo = value;
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
            itemCount: filtersController.listPromotionType!.length,
          ),
        ),
      ),
    );
  }
}