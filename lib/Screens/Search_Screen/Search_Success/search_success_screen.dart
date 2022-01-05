import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Filters_Screen/filters_controller.dart';

class SearchSuccessScreen extends StatelessWidget {
  const SearchSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filtersController = Get.put(FiltersController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Stack(
          children: [
            FutureBuilder(
              future: filtersController.getName(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  "Welcome, ${snapshot.data}\n",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.black,
                      ),
                );
              },
            ),
            Positioned(
              top: Get.height * 0.07,
              child: FutureBuilder(
                future: filtersController.getLocation(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    "${snapshot.data}",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.black,
                        ),
                  );
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
          child: GetBuilder<FiltersController>(
            init: filtersController,
            builder: (filtersController) {
            return ListView.builder(
              itemCount: filtersController.filtersSuccess.length,
              itemBuilder: (context, index) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: Get.height * 0.18,
                        width: Get.width * 0.8,
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 500,
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 8, right: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${filtersController.filtersSuccess[index].img}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Positioned(
                              top: 10,
                              right: 10,
                              child: const Icon(Icons.star_border),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${filtersController.filtersSuccess[index].name}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontSize: 20,
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
                                  "${filtersController.filtersSuccess[index].rate}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontSize: 20,
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
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${filtersController.filtersSuccess[index].location}",
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
                            Text(
                              "1.2 Km",
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
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${filtersController.filtersSuccess[index].foodCate}",
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
                      SizedBox(
                        height: Get.height * 0.03,
                      )
                    ],
                  ),
                  Positioned(
                    top: Get.height * 0.02,
                    right: Get.width * 0.15,
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
                          "-${filtersController.filtersSuccess[index].sale}%",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      )),
    );
  }
}
