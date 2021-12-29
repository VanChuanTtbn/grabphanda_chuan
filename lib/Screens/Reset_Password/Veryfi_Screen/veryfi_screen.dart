import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Screens/Reset_Password/Reset_Email/reset_email_screen.dart';
import 'package:grabpanda1/Screens/Reset_Password/Reset_Password/reset_pasword_screen.dart';
import 'package:grabpanda1/Screens/Reset_Password/Veryfi_Screen/verify_controller.dart';

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
        centerTitle: true,
        title: Text(
          "Verification",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.black),
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
          child: Stack(
            children: [
              Form(
                key: _veryfiFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.9,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter your \nVerification Code",
                          style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
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
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'We send verification code to your email ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                  text: '${controller.restoreModel().email}. ',
                                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                TextSpan(
                                  text: 'You can check your inbox.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ]
                          )),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Get.to(ResetEmailScreen());
                          },
                          child: Text(
                            "I didn’t received the code? Send again",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.lightBlueAccent,
                            ),
                          ),),
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
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
                          child: Text(
                            "Veryfi",
                            style: Theme.of(context).textTheme.button?.copyWith(
                              color: Colors.white,
                            )
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
