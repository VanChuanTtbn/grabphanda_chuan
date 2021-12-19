import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';

class SearchLocationScreen extends StatelessWidget{

  String? searchLocation;
  final _searchLocationFormKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 74,
        title: const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Search Location",
              style: TextStyle(color: Colors.black),
            )),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _searchLocationFormKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Find Restaurants Near You",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "We need your address to find the right restaurants for you",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: TextFormField(
                        onSaved: (value) => searchLocation = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 12.0),
                          hintText: "Enter a New Address",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Or",
                        style: TextStyle(fontSize: 20,
                          color: Colors.grey,
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
                            children: const [
                              Icon(Icons.location_on_outlined),
                              Text(
                                "Use Current Location",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}