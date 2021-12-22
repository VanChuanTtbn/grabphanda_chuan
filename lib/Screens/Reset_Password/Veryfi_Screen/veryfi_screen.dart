import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Password/reset_pasword_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Veryfi_Screen/verify_controller.dart';

class VeryfiScreen extends StatelessWidget {
  String? veryfi;
  bool? check;
  final _veryfiFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: VerificationCode(
                        keyboardType: TextInputType.number,
                        length: 6,
                        onCompleted: (String value){
                          veryfi = value;
                        },
                        onEditing: (bool value){
                          check = value;
                          if (check == false) FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 340,
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'We send verification code to your email ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                              children: [
                                TextSpan(
                                  text: '${controller.restoreModel().email}. ',
                                  style: const TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'You can check your inbox.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ]
                          )),
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