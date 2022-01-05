import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/filters_entity.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';

class FoodCategoriesController extends BaseController {
  List<FoodEntity>? listFoodCategories;
  late CollectionReference foodCategories;
  FoodCategoriesController() {
    listFoodCategories = [
      FoodEntity(
        type: "Asian cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "India Cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Western Cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Japanese cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Korean cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Chinese cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Italy cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Fast food",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Bubble tea",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Local Food",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Cakes & Dessert",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Buffet",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Steamboat",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Vegetarian",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "HalaI Food",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "PUB",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Coffee Shop",
        checkFoodCategories: false,
      ),
    ];
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   offerOfDay = firebaseFirestore.collection('food');
  //   listCulinary.bindStream(getAllCulinary());
  // }

  // getCount() {
  //   getFoodCate = [];
  //   for (var element in listFoodCategories!) {
  //     if (element.checkFoodCategories == true) {
  //       getFoodCate.add(element.type);
  //     }
  //   }
  //   print(getFoodCate);
  // }
}
