import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Filters_Screen/filters_controller.dart';
import 'package:grabpanda1/Screens/Search_Screen/Filters_Screens/Filters_Screen/filters_screen.dart';

class SearchSuccessScreen extends StatefulWidget {
  const SearchSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SearchSuccessScreen> createState() => _SearchSuccessScreenState();
}

class _SearchSuccessScreenState extends State<SearchSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final filtersController = Get.put(FiltersController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Filters Success",
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
            setState(() {
              filtersController.clearsFilter();
              filtersController.clearsLocation();
              filtersController.clearsFoodCate();
              filtersController.clearsHotPromo();
              Get.off(FiltersScreen());
            });
          },
        ),
        elevation: 0,
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
