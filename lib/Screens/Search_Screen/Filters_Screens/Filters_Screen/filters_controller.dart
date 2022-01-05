import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/data_entity.dart';
import 'package:grabpanda1/Models/Entity/food_entity.dart';

class FiltersController extends BaseController {
  List<FoodEntity>? listFoodCategories;
  List<FoodEntity>? listPromotionType;
  List<DataEntity> filtersSuccess = [];
  List<FoodEntity>? listLocation;
  List getFoodCate = [];
  List getPromo = [];
  List getLoca = [];
  String? location;
  int selectValue = 0;

  FiltersController() {
    listLocation = [
      FoodEntity(
        location: "Kampong Glam",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Tiong Bahru",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Jalan Besar",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Bras Basah.Bugis",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Kampong Glam",
        checkLoca: false,
      ),
      FoodEntity(
        location: "China Town",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Orchard",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Little India",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Marina Bay",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Civic",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Haji Lane",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Clark Quay",
        checkLoca: false,
      ),
      FoodEntity(
        location: "Sentosa",
        checkLoca: false,
      ),
    ];

    listFoodCategories = [
      FoodEntity(
        type: "Asian cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "India Cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Western Cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Japanese cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Korean cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Chinese cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Italy cuisine",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Fast food",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Bubble tea",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Local Food",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Cakes & Dessert",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Buffet",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Steamboat",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Vegetarian",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "HalaI Food",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "PUB",
        checkFoodCategories: false,
      ),
      FoodEntity(
        type: "Coffee Shop",
        checkFoodCategories: false,
      ),
    ];

    listPromotionType = [
      FoodEntity(
        promotionType: "35",
        checkPromo: false,
      ),
      FoodEntity(
        promotionType: "20",
        checkPromo: false,
      ),
      FoodEntity(
        promotionType: "5",
        checkPromo: false,
      ),
      FoodEntity(
        promotionType: "10",
        checkPromo: false,
      ),
      FoodEntity(
        promotionType: "15",
        checkPromo: false,
      ),
      FoodEntity(
        promotionType: "25",
        checkPromo: false,
      ),
      FoodEntity(
        promotionType: "30",
        checkPromo: false,
      ),
      // FoodEntity(
      //   promotionType: "",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Bubble tea",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Local Food",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Cakes & Dessert",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Buffet",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Steamboat",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Vegetarian",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "HalaI Food",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "PUB",
      //   checkPromo: false,
      // ),
      // FoodEntity(
      //   promotionType: "Coffee Shop",
      //   checkPromo: false,
      // ),
    ];
  }

  filtersFoodCate() async {
    await getData();
    for(var e in getListData){
      if(getFoodCate.any((element) => e.foodCate!.contains(element))){
        filtersSuccess.add(e);
      }
    }
    print(filtersSuccess.toList());
  }

  filtersPromo() async {
    await getData();
    for(var e in getListData){
      if(getPromo.any((element) => e.sale!.contains(element))){
        filtersSuccess.add(e);
      }
    }
    print(filtersSuccess.toList());
  }

  filtersLocation() async {
    await getData();
    for(var e in getListData){
      if(e.location!.contains(location as Pattern)){
        if(!filtersSuccess.any((element) => e.name!.contains(element.name as Pattern))){
          filtersSuccess.add(e);
        }
      }
    }
    print(filtersSuccess.toList());
  }

  getCountFoodCate() {
    getFoodCate = [];
    for (var element in listFoodCategories!) {
      if (element.checkFoodCategories == true) {
        getFoodCate.add(element.type);
      }
    }
  }

  getCountPromo() {
    getPromo = [];
    for (var element in listPromotionType!) {
      if (element.checkPromo == true) {
        getPromo.add(element.promotionType);
      }
    }
  }

  String? getCountLoca() {
    return location = listLocation![selectValue].location;
  }

  clearsLocation(){
    selectValue = 0;
    location = null;
  }

  clearsFoodCate(){
    getFoodCate = [];
    for(var e in listFoodCategories!){
      e.checkFoodCategories = false;
    }
  }

  clearsHotPromo(){
    getPromo = [];
    for(var e in listPromotionType!){
      e.checkPromo = false;
    }
  }

  clearsFilter(){
    filtersSuccess = [];
  }
}
