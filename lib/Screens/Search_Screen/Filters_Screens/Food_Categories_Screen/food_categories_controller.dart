import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Models/Entity/food_entity.dart';

class FoodCategoriesController extends BaseController {
  List<FoodEntity>? listFoodCategories;
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
  getCount() {
    var count = [];
    listFoodCategories!.forEach(
      (element) {
        if (element.checkFoodCategories == true) {
          count.add(element.type);
        }
      },
    );
  }
}
