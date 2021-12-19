import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Password/reset_pasword_screen.dart';

class VeryfiScreen extends StatelessWidget {
  String? veryfi;
  final _veryfiFormKey = GlobalKey<FormState>();
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
              "Verification",
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
                key: _veryfiFormKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter your Verification Code",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: TextFormField(
                        onSaved: (value) => veryfi = value,
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
                          hintText: "Veryfi OTP",
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 22,
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
                              "We send verification code to your email . You can check your inbox.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "I didn’t received the code? Send again",
                            style: TextStyle(
                              color: Colors.lightBlue,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 40,
                        width: 268,
                        child: ElevatedButton(
                          onPressed: () async {
                            _veryfiFormKey.currentState?.save();
                            final result =
                                await controller.veryfiOTP(otp: veryfi);
                            if (result) {
                              Get.off(ResetPasswordScreen());
                            } else {
                              print("veryfiLoi");
                            }
                          },
                          child: const Text(
                            "Veryfi",
                            style: TextStyle(color: Colors.white),
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
