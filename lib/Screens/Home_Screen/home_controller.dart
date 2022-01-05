import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/culinary_entity.dart';
import 'package:grabpanda1/Models/Entity/data_entity.dart';

class HomeController extends BaseController {
  List<DataEntity> listOffer = [];
  List<DataEntity> listPopular = [];
  RxList<CulinaryEntity> listCulinary = RxList<CulinaryEntity>([]);
  late CollectionReference culinary;

  @override
  void onInit() {
    super.onInit();
    culinary = firebaseFirestore.collection('culinary');
    listCulinary.bindStream(getAllCulinary());
  }

  getOfferOfDay() async {
    await getData();
    listOffer = [];
    for (var element in getListData) {
      if (element.type == "1") {
       listOffer.add(element);
      }
    }
  }

  getPopular() async {
    await getData();
    listPopular = [];
    for (var element in getListData) {
      if (element.type == "2") {
        listPopular.add(element);
      }
    }
  }


  Stream<List<CulinaryEntity>> getAllCulinary() =>
      culinary.snapshots().map((event) =>
          event.docs.map((e) => CulinaryEntity.fromMap(e)).toList());
}
