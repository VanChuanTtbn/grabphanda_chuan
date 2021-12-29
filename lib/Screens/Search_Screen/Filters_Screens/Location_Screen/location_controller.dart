

import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';

class LocationController extends BaseController {
  List<FoodEntity>? listLocation;
  LocationController() {
    listLocation = [
      FoodEntity(
        location: "Kampong Glam",
      ),
      FoodEntity(
        location: "Tiong Bahru",
      ),
      FoodEntity(
        location: "Jalan Besar",
      ),
      FoodEntity(
        location: "Bras Basah.Bugis:",
      ),
      FoodEntity(
        location: "Kampong Glam",
      ),
      FoodEntity(
        location: "China Town",
      ),
      FoodEntity(
        location: "Orchard",
      ),
      FoodEntity(
        location: "Little India",
      ),
      FoodEntity(
        location: "Marina Bay",
      ),
      FoodEntity(
        location: "Civic",
      ),
      FoodEntity(
        location: "Haji Lane",
      ),
      FoodEntity(
        location: "Clark Quay",
      ),
      FoodEntity(
        location: "Sentosa",
      ),
    ];
  }
}
