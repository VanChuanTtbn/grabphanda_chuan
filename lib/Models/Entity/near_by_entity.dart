import 'package:cloud_firestore/cloud_firestore.dart';

class NearByEntity{
  String? name;
  String? img;
  String? location;
  String? rate;
  NearByEntity({
    this.name,
    this.img,
    this.location,
    this.rate,

});
  NearByEntity.fromMap(DocumentSnapshot data){
    img = data["img"];
    name =  data["name"];
    location = data["location"];
    rate = data['rate'];
  }
}