import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Controller/controller.dart';

class SearchLocationScreen extends StatelessWidget {
  String? searchLocation;
  final _searchLocationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 74,
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Search Location",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _searchLocationFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 300,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Find Restaurants Near You",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  width: 340,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'We need your address to find the right restaurants for you',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                    onSaved: (value) => searchLocation = value,
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
                      hintStyle: GoogleFonts.inter(
                        textStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      hintText: "Enter a New Address",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Or",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 40,
                    width: 268,
                    child: ElevatedButton(
                      onPressed: () async {
                        _searchLocationFormKey.currentState?.save();
                        // final result =
                        // await controller.veryfiOTP(otp: veryfi);
                        // if (result) {
                        //   Get.off(ResetPasswordScreen());
                        // } else {
                        //   print("veryfiLoi");
                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Text(
                            "Use Current Location",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nearby Locations",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Albion (Oswego County)\n',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '60 Robertson Quay The Quayside 01-05, Singapore 238252 Singapore',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Brighton (Monroe County)\n',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '1 Fullerton Square Fullerton Hotel The Fullerton Hotel, Singapore 049178 Singapore',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
