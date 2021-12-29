import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';

class HomeController extends BaseController {
  List<FoodEntity>? listDish;
  List<FoodEntity>? listPopuler;
  HomeController() {
    listDish = [
      FoodEntity(
        img: 'assets/img/artemis_grill.png',
        name: 'Artemis Grill',
        sale: '25',
      ),
      FoodEntity(
        img: 'assets/img/burger_king.png',
        name: 'Burger King',
        sale: '25',
      ),
      FoodEntity(
        img: 'assets/img/burnt_ends.png',
        name: 'Burnt Ends',
        sale: '25',
      ),
      FoodEntity(
        img: 'assets/img/koma.png',
        name: 'Koma',
        sale: '25',
      ),
      FoodEntity(
        img: 'assets/img/meta.png',
        name: 'Meta',
        sale: '25',
      ),
    ];
    listPopuler = [
      FoodEntity(
        img: 'assets/img/domino’s_pizza.png',
        name: "Domino's Pizza",
        type: "Pizza/Fast Food",
      ),
      FoodEntity(
        img: 'assets/img/fat_cow.png',
        name: "Fat Cow",
        type: "Asia",
      ),
      FoodEntity(
        img: 'assets/img/esora.png',
        name: "Esora",
        type: "Asia",
      ),
      FoodEntity(
        img: 'assets/img/coucou.png',
        name: "Coucou",
        type: "Asia",
      ),
      FoodEntity(
        img: 'assets/img/new_ubin_seafood.png',
        name: "New Ubin Seafood",
        type: "Asia",
      ),
    ];
  }

}
