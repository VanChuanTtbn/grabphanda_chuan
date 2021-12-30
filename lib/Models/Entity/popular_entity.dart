import 'package:cloud_firestore/cloud_firestore.dart';

class PopularEntity {
  String? img;
  String? name;
  String? type;
  String? rate;
  PopularEntity({
    this.type,
    this.img,
    this.name,
    this.rate,
  });

  PopularEntity.fromMap(DocumentSnapshot data){
    img = data["img"];
    name =  data["name"];
    type = data["type"];
    rate = data["rate"];
  }
}