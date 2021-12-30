import 'package:cloud_firestore/cloud_firestore.dart';

class CulinaryEntity {
  String? img;
  String? name;
  CulinaryEntity({
    this.img,
    this.name,
  });

  CulinaryEntity.fromMap(DocumentSnapshot data){
    img = data["img"];
    name =  data["name"];
  }
}