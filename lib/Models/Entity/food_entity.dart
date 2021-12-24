class FoodEntity {
  String? img;
  String? name;
  String? type;
  String? sale;
  bool? checkFoodCategories = false;
  String? location;
  FoodEntity({
    this.type,
    this.img,
    this.name,
    this.sale,
    this.checkFoodCategories = false,
    this.location
});
}