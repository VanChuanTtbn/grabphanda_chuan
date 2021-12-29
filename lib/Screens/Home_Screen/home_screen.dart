import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Utils/custom_appbar.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Stack(
          children: [
            FutureBuilder(
              future: controller.getName(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                return Text("Welcome, ${snapshot.data}\n",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                  ),);
              },
            ),
            Positioned(
              top: Get.height * 0.07,
              child: FutureBuilder(
                future: controller.getLocation(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  return Text("${snapshot.data}",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                    ),);
                },
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff13B2C6),
                Color(0xff7BCBD5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.notifications_sharp),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomAppBar(),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff13B2C6),
                          Color(0xff7BCBD5),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        tileMode: TileMode.clamp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "- OFFER OF THE DAY -",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.18,
                          width: Get.width * 0.9,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.listDish!.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: Get.width * 0.55,
                                          padding: const EdgeInsets.only(
                                              bottom: 10, left: 8, right: 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              scale: 0.5,
                                              image: AssetImage(
                                                "${controller.listDish![index].img}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Spacer(),
                                              Text(
                                                "${controller.listDish![index].name}                                                  ",
                                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.justify,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -2,
                                    left: 15,
                                    child: Container(
                                      height: Get.height *0.04,
                                      width: Get.width * 0.14,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.yellow,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "-${controller.listDish![index].sale}%",
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "- ",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.lightBlueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "CULINARY CATEGORY ",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "-",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ], //AppShadow.boxShadowPost,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.emoji_food_beverage,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Text("Korean",
                                  style: Theme.of(context).textTheme.bodyText1,),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ], //AppShadow.boxShadowPost,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.emoji_food_beverage_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Text("Western", style:  Theme.of(context).textTheme.bodyText1,),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ], //AppShadow.boxShadowPost,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.fastfood,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Text("Japanese", style: Theme.of(context).textTheme.bodyText1,),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ], //AppShadow.boxShadowPost,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.no_food,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Text("Asian", style: Theme.of(context).textTheme.bodyText1,),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 15,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ], //AppShadow.boxShadowPost,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.no_food,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Text("Fast Food", style: Theme.of(context).textTheme.bodyText1,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "- ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            children: [
                              TextSpan(
                                text: "POPULAR RESTAURANTS ",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: "-",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          height: Get.height * 0.3,
                          width: Get.width * 0.9,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Get.height * 0.18,
                                        width: Get.width * 0.65,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 200,
                                              padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                  left: 8,
                                                  right: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "${controller.listPopuler![index].img}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Icon(Icons.star_border),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 5, right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${controller.listPopuler![index].name}",
                                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.redAccent,
                                                ),
                                                Text(
                                                  "4.2",
                                                  style: Theme.of(context).textTheme.headline6?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.justify,
                                                  maxLines: 2,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${controller.listPopuler![index].type}",
                                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                            ),
                                            Text(
                                              "1.2 Km",
                                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: controller.listPopuler!.length),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
