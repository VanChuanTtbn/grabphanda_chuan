import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Food_Categories_Screen/food_categories_screen.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Location_Screen/location_screen.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Promotion_Type_Screen/promotion_type_screen.dart';
import 'package:grabpanda1/Screens/Search_Screen/Search_Success/search_success_screen.dart';
import 'package:grabpanda1/Screens/Search_Screen/search_screen.dart';
import 'filters_controller.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  double _currentSliderValue = 400;

  @override
  Widget build(BuildContext context) {
    final filtersController = Get.put(FiltersController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Filters",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            filtersController.clearsFilter();
            filtersController.clearsLocation();
            filtersController.clearsFoodCate();
            filtersController.clearsHotPromo();
            Get.off(const BottomBarScreen(tabIndex: 1,));
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<FiltersController>(
          init: filtersController,
          builder: (filtersController) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width * 1,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Food categories",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      insetPadding: const EdgeInsets.only(
                                        top: 50,
                                        right: 10,
                                        left: 10,
                                        bottom: 10,
                                      ),
                                      title: Text(
                                        'Food categories',
                                        style: GoogleFonts.inter(),
                                      ),
                                      content: Stack(
                                        children: [
                                          FoodCategoriesScreen(),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              filtersController
                                                  .clearsFoodCate();
                                              Get.back();
                                            });
                                          },
                                          child: Text(
                                            "Clear",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.lightBlueAccent,
                                                ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              filtersController
                                                  .getCountFoodCate();
                                              filtersController
                                                  .filtersFoodCate();
                                              Get.back();
                                            });
                                          },
                                          child: Text(
                                            "Ok",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.lightBlue,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "${filtersController.getFoodCate.length} Selected",
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.lightBlueAccent,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width * 1,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      insetPadding: const EdgeInsets.only(
                                        top: 20,
                                        right: 5,
                                        left: 5,
                                        bottom: 10,
                                      ),
                                      title: Text(
                                        'Location',
                                        style: GoogleFonts.inter(),
                                      ),
                                      content: Stack(
                                        children: [
                                          PhysicalModel(
                                            color: Colors.white,
                                            elevation: 5.0,
                                            shadowColor: Colors.black,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                  20.0,
                                                  10.0,
                                                  20.0,
                                                  10.0,
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                hintStyle: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.0),
                                                ),
                                                hintText: "Search Location",
                                                prefixIcon: const Icon(
                                                  Icons.search,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 60),
                                            child: LocationScreen(),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              filtersController
                                                  .clearsLocation();
                                              Get.back();
                                            });
                                          },
                                          child: Text(
                                            "Clear",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.lightBlueAccent,
                                                ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              filtersController.getCountLoca();
                                              filtersController
                                                  .filtersLocation();
                                              Get.back();
                                            });
                                          },
                                          child: Text(
                                            "Ok",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.lightBlue,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "${filtersController.location ?? "Select"} ",
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.lightBlueAccent,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Container(
                      height: Get.height * 0.1,
                      width: Get.width * 1,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Promotion type",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      insetPadding: const EdgeInsets.only(
                                        top: 50,
                                        right: 10,
                                        left: 10,
                                        bottom: 10,
                                      ),
                                      title: Text(
                                        'Promotion Type',
                                        style: GoogleFonts.inter(),
                                      ),
                                      content: Stack(
                                        children: [
                                          PromotionTypeScreen(),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              filtersController
                                                  .clearsHotPromo();
                                              Get.back();
                                            });
                                          },
                                          child: Text(
                                            "Clear",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.lightBlueAccent,
                                                ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              filtersController.getCountPromo();
                                              filtersController.filtersPromo();
                                              Get.back();
                                            });
                                          },
                                          child: Text(
                                            "Ok",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.lightBlue,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "${filtersController.getPromo.length} Selected",
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.lightBlueAccent,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width * 1,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.only(
                          top: 3, left: 10, right: 10, bottom: 0),
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Merchant name",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                              hintText: "Type text here",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Container(
                      height: Get.height * 0.2,
                      width: Get.width * 1,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.only(
                          top: 3, left: 10, right: 10, bottom: 0),
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Pricing range",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Column(
                            children: [
                              Slider(
                                value: _currentSliderValue,
                                max: 2500,
                                divisions: 500,
                                min: 0,
                                inactiveColor: Colors.grey,
                                label: _currentSliderValue.toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                  });
                                },
                                semanticFormatterCallback: (double value) {
                                  return "$value";
                                },
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("100"),
                                    Text("500"),
                                    Text("1000"),
                                    Text("1500"),
                                    Text("2000"),
                                    Text("2500"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.only(
                          top: 3, left: 10, right: 10, bottom: 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Other prices",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                              hintText: "Type text here",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: Get.height * 0.07,
                          width: Get.width * 0.4,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                filtersController.clearsHotPromo();
                                filtersController.clearsFoodCate();
                                filtersController.clearsLocation();
                              });
                            },
                            child: Text(
                              "Clear",
                              style:
                                  Theme.of(context).textTheme.button?.copyWith(
                                        color: Colors.lightBlueAccent,
                                      ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.07,
                          width: Get.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Get.to(const SearchSuccessScreen());
                              });
                            },
                            child: Text("Apply",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: Colors.white,
                                    )),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.lightBlueAccent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 96,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
