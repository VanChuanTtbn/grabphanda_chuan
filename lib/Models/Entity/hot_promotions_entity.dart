import 'package:cloud_firestore/cloud_firestore.dart';

class HotPromotionsEntity {
  String? img;
  String? name;
  String? sale;
  HotPromotionsEntity({
    this.sale,
    this.img,
    this.name,
  });

  HotPromotionsEntity.fromMap(DocumentSnapshot data){
    img = data["img"];
    name =  data["name"];
    sale = data["sale"];
  }
}