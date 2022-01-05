import 'package:cloud_firestore/cloud_firestore.dart';

class FiltersEntity{
  String? name;
  String? img;
  String? location;
  String? type;
  String? rate;
  String? sale;
  FiltersEntity({
    this.location,
    this.rate,
    this.img,
    this.name,
    this.type,
    this.sale,
});
  FiltersEntity.fromMap(DocumentSnapshot data){
    img = data["img"];
    name =  data["name"];
    location = data["location"];
    rate = data["rate"];
    type = data["type'"];
    sale = data["sale"];
  }
}