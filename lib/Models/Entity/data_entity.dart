import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntity{
  String? name;
  String? img;
  String? location;
  String? foodCate;
  String? type;
  String? rate;
  String? sale;
  DataEntity({
    this.sale,
    this.rate,
    this.location,
    this.type,
    this.name,
    this.img,
    this.foodCate,
});
  DataEntity.fromMap(DocumentSnapshot data){
    name = data["name"];
    img = data["img"];
    location = data["location"];
    foodCate = data["food_cate"];
    type = data["type"].toString();
    sale = data["sale"].toString();
    rate = data["rate"].toString();
  }
}