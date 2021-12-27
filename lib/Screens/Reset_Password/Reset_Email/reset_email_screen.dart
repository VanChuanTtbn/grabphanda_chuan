import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Screens/Register_Screen/register_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Email/reset_mail_controller.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Password/reset_pasword_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Veryfi_Screen/veryfi_screen.dart';

class ResetEmailScreen extends StatelessWidget {
  final _rsEmailFormKey = GlobalKey<FormState>();
  String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetEmailController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.17,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppImg.imgLogo,
                      height: 159,
                      width: 146,
                    ),
                  ),
                  Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.6,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "GrabPanda",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 5,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'Enter your email address below & we’ll send you an email with Instruction on how change your Password',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Form(
                    key: _rsEmailFormKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          child: TextFormField(
                            onSaved: (value) => email = value,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              hintStyle:
                                  GoogleFonts.inter(
                                    textStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                                  ),
                              hintText: "Email",
                              suffixIcon: const Icon(
                                Icons.email,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: Get.height * 0.07,
                            width: Get.width * 0.83,
                            child: ElevatedButton(
                              onPressed: () async {
                                _rsEmailFormKey.currentState?.save();
                                final result =
                                    await controller.sendOTP(email: email);
                                if (result) {
                                  Get.to(ResetPasswordScreen());
                                } else {
                                  print("rsemailLoi");
                                }
                                Get.to(VeryfiScreen());
                              },
                              child: Text(
                                "Send Mail",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(color: Colors.white),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.lightBlue),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
