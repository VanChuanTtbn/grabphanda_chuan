import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/culinary_entity.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';
import 'package:grabpanda1/Models/Entity/offer_of_day_entity.dart';
import 'package:grabpanda1/Models/Entity/popular_entity.dart';

class HomeController extends BaseController {
  RxList<OfferOfDayEntity> listOffer = RxList<OfferOfDayEntity>([]);
  RxList<PopularEntity> listPopular = RxList<PopularEntity>([]);
  RxList<CulinaryEntity> listCulinary = RxList<CulinaryEntity>([]);
  late CollectionReference offerOfDay;
  late CollectionReference popular;
  late CollectionReference culinary;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    offerOfDay = firebaseFirestore.collection('food');
    popular = firebaseFirestore.collection('food_popular');
    culinary = firebaseFirestore.collection('culinary');
    listOffer.bindStream(getAllOfferOfDay());
    listPopular.bindStream(getAllPopular());
    listCulinary.bindStream(getAllCulinary());
  }

  Stream<List<OfferOfDayEntity>> getAllOfferOfDay() =>
      offerOfDay.snapshots().map((event) =>
          event.docs.map((e) => OfferOfDayEntity.fromMap(e)).toList());

  Stream<List<PopularEntity>> getAllPopular() =>
      popular.snapshots().map((event) =>
          event.docs.map((e) => PopularEntity.fromMap(e)).toList());

  Stream<List<CulinaryEntity>> getAllCulinary() =>
      culinary.snapshots().map((event) =>
          event.docs.map((e) => CulinaryEntity.fromMap(e)).toList());
}
