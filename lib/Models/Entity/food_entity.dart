class FoodEntity {
  String? img;
  String? name;
  String? type;
  String? sale;
  bool? checkFoodCategories = false;
  String? location;
  String? promotionType;
  FoodEntity({
    this.type,
    this.img,
    this.name,
    this.sale,
    this.checkFoodCategories = false,
    this.location,
    this.promotionType,
});
}