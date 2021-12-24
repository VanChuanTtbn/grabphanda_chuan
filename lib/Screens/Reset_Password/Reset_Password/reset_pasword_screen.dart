import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Screens/Home_Screen/home_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Password/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _rsPasswordFormKey = GlobalKey<FormState>();
  String? password;
  String? rePassword;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 74,
        title: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Reset Password",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black),
                ))),
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
              Column(
                children: [
                  const SizedBox(
                    height: 32,
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
                    height: 48,
                    width: 189,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    width: 340,
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Please enter your password below',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _rsPasswordFormKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          child: TextFormField(
                            onSaved: (value) => password = value,
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
                                textStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "New Password",
                              suffixIcon: const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Must be at Least 8 Characters",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
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
                            onSaved: (value) => rePassword = value,
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
                                textStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "Confirm password",
                              suffixIcon: const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Both Passwords must Match",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                                _rsPasswordFormKey.currentState?.save();
                                final result = await controller.changePassword(
                                    password: password, rePassword: rePassword);
                                if (result!) {
                                  print("change Pass OK");
                                  Get.off(HomeScreen());
                                } else {
                                  print("changeLoi");
                                }
                              },
                              child: Text(
                                "Reset Passwod",
                                style: GoogleFonts.poppins(
                                  textStyle:
                                      const TextStyle(color: Colors.white),
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
