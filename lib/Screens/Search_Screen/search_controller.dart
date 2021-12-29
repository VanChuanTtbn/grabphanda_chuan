

import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';

class SearchController extends BaseController {
  List<FoodEntity>? hotPromotions;
  List<FoodEntity>? nearBy;
  List<FoodEntity>? bestChoice;
  SearchController() {
    nearBy = [
      FoodEntity(
        img: 'assets/img/sree_annapoorna.png',
        name: "Sree Annapoorna",
        type: "International",
      ),
      FoodEntity(
        img: 'assets/img/kki_sweets.png',
        name: "Kki Sweets",
        type: "Dempsey",
      ),
      FoodEntity(
        img: 'assets/img/odette.png',
        name: "Odetter",
        type: "International",
      ),
      FoodEntity(
        img: 'assets/img/nouri.png',
        name: "Nouri",
        type: "International",
      ),
      FoodEntity(
        img: 'assets/img/cloudstreet.png',
        name: "Cloudstreet",
        type: "International",
      ),
    ];
    hotPromotions = [
      FoodEntity(
        img: 'assets/img/the_ourtyard.png',
        name: 'The Courtyard',
        sale: "20",
      ),
      FoodEntity(
        img: 'assets/img/whitegrass.png',
        name: 'Whitegrass',
        sale: "25",
      ),
      FoodEntity(
        img: 'assets/img/salted_hung.png',
        name: 'Salted & Hung',
        sale: "35",
      ),
      FoodEntity(
        img: 'assets/img/artichoke.png',
        name: 'Artichoke',
        sale: "15",
      ),
      FoodEntity(
        img: 'assets/img/candlenut.png',
        name: 'Candlenut',
        sale: "20",
      ),
    ];
    bestChoice = [
      FoodEntity(
        img: 'assets/img/seafood.png',
        type: "Seafood",
      ),
      FoodEntity(
        img: 'assets/img/steak.png',
        type: "Steak",
      ),
      FoodEntity(
        img: 'assets/img/chicken.png',
        type: "Chicken",
      ),
      FoodEntity(
        img: 'assets/img/curry.png',
        type: "Curry",
      ),
      FoodEntity(
        img: 'assets/img/Fastfood.png',
        type: "Fastfood",
      ),
    ];
  }
}
