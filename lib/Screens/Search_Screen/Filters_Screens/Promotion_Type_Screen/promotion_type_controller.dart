

import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';

class PromotionTypeController extends BaseController{
  List<FoodEntity>? listPromotionType;
  List count = [];
  PromotionTypeController() {
    count = [];
    listPromotionType = [
      FoodEntity(
        promotionType: "35",
        checkFoodCategories: false,
      ),
      FoodEntity(
        promotionType: "20%",
        checkFoodCategories: false,
      ),
      FoodEntity(
        promotionType: "5%",
        checkFoodCategories: false,
      ),
      FoodEntity(
        promotionType: "10%",
        checkFoodCategories: false,
      ),
      FoodEntity(
        promotionType: "15%",
        checkFoodCategories: false,
      ),
      FoodEntity(
        promotionType: "25%",
        checkFoodCategories: false,
      ),
      FoodEntity(
        promotionType: "30%",
        checkFoodCategories: false,
      ),
      // FoodEntity(
      //   promotionType: "",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Bubble tea",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Local Food",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Cakes & Dessert",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Buffet",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Steamboat",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Vegetarian",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "HalaI Food",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "PUB",
      //   checkFoodCategories: false,
      // ),
      // FoodEntity(
      //   promotionType: "Coffee Shop",
      //   checkFoodCategories: false,
      // ),
    ];
  }
  getCount() {
    count = [];
    for (var element in listPromotionType!) {
      if (element.checkFoodCategories == true) {
        count.add(element.promotionType);
      }
    }
  }
}