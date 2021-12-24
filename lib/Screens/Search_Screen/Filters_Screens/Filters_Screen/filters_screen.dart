import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Food_Categories_Screen/food_categories_controller.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Food_Categories_Screen/food_categories_screen.dart';
import 'package:grabpanda/Screens/Search_Screen/Filters_Screens/Location_Screen/location_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  double _currentSliderValue = 200;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodCategoriesController());
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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 56,
                width: 359,
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
                      style: GoogleFonts.poppins(
                        fontSize: 17,
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
                                    onPressed: () {},
                                    child: Text(
                                      "Clear",
                                      style: GoogleFonts.poppins(
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.getCount();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Ok",
                                      style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
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
                              "${controller.getCount()?.length ?? 0} Selected",
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
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                width: 359,
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
                      style: GoogleFonts.poppins(
                        fontSize: 17,
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
                                          contentPadding: const EdgeInsets.fromLTRB(
                                            20.0,
                                            10.0,
                                            20.0,
                                            10.0,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                            textStyle:
                                            const TextStyle(color: Colors.black, fontSize: 12.0),
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
                                      margin: const EdgeInsets.only(top: 60),
                                        child: LocationScreen(),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Clear",
                                      style: GoogleFonts.poppins(
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.getCount();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Ok",
                                      style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
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
                              "0 Selected",
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
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                width: 359,
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
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "0 Selected",
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
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 78,
                width: 359,
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
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.grey, fontSize: 12.0),
                        ),
                        hintText: "Type text here",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 110,
                width: 359,
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
                        style: GoogleFonts.poppins(
                          fontSize: 17,
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
                          semanticFormatterCallback: (double value){
                            return "${value}";
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 25, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const SizedBox(
                height: 15,
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
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.grey, fontSize: 12.0),
                        ),
                        hintText: "Type text here",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 96,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 168.27,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Clear",
                          style: GoogleFonts.poppins(
                              color: Colors.lightBlueAccent, fontSize: 16),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Apply",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlueAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 96,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
