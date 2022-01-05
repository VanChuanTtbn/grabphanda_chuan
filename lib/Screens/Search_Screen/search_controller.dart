import 'package:grabpanda1/Controller/controller.dart';
import 'package:grabpanda1/Models/Entity/data_entity.dart';

class SearchController extends BaseController {
  List<DataEntity> hotPromotions = [];
  List<DataEntity> nearBy = [];
  List<DataEntity> bestChoice = [];


  getNearBy() async {
    await getData();
    nearBy = [];
    for (var element in getListData) {
      if (element.type == "3") {
        nearBy.add(element);
      }
    }
  }

  getHotPromo() async {
    await getData();
    hotPromotions = [];
    for (var element in getListData) {
      if (element.type == "4") {
        hotPromotions.add(element);
      }
    }
  }

  getBestChoice() async {
    await getData();
    bestChoice = [];
    for (var element in getListData) {
      if (element.type == "5") {
        bestChoice.add(element);
      }
    }
  }
}
