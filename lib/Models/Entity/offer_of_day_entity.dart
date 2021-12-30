import 'package:cloud_firestore/cloud_firestore.dart';

class OfferOfDayEntity {
  String? img;
  String? name;
  String? sale;
  OfferOfDayEntity({
    this.sale,
    this.img,
    this.name,
  });

  OfferOfDayEntity.fromMap(DocumentSnapshot data){
    img = data["img"];
    name =  data["name"];
    sale = data["sale"];
  }
}