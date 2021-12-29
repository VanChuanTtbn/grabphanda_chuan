import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Screens/Search_Screen/search_controller.dart';

import 'Filters_Screens/Filters_Screen/filters_screen.dart';

class SearchScreen extends StatelessWidget {
  final _searchFormKey = GlobalKey<FormState>();
  String? search;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Stack(
          children: [
            FutureBuilder(
              future: controller.getName(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text("Welcome, ${snapshot.data}\n",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.black,
                  ),);
              },
            ),
            Positioned(
              top: Get.height * 0.07,
              child: FutureBuilder(
                future: controller.getLocation(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text("${snapshot.data}",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.black,
                    ),);
                },
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.notifications_sharp,
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _searchFormKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onSaved: (value) => search = value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      hintText: "Search for restaurant, dishes …",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Near by",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.filter_alt_outlined,
                          size: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(FiltersScreen());
                          },
                          child: Text(
                            "Filters",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    )
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
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.2,
                            width: Get.width * 0.65,
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: Get.width * 0.65,
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "${controller.nearBy![index].img}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.nearBy![index].name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  width: Get.width * 0.13,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      "4.5",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 0, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.nearBy![index].type}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  width: Get.width * 0.15,
                                ),
                                Text(
                                  "0.5 Km",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
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
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 0,
                    );
                  },
                  itemCount: controller.nearBy!.length,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hot Promotions",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                height: Get.height * 0.2,
                width: Get.width * 0.9,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: Get.width * 0.65,
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width * 0.65,
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 0, right: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "${controller.hotPromotions![index].img}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Container(
                                    width: 10000,
                                    color: Colors.white70,
                                    child: Text(
                                      "${controller.hotPromotions![index].name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                            backgroundColor: Colors.white70,
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.14,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-${controller.hotPromotions![index].sale}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 1,
                    );
                  },
                  itemCount: controller.hotPromotions!.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Best choice for you",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                height: Get.height * 0.3,
                width: Get.width * 0.9,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width * 0.4,
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 8, right: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "${controller.bestChoice![index].img}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Text(
                                    "${controller.bestChoice![index].type}                                                  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
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
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 1,
                    );
                  },
                  itemCount: controller.bestChoice!.length,
                ),
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
