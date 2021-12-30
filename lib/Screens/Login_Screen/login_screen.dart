import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grabpanda1/Commons/app_img.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';
import 'package:grabpanda1/Screens/Home_Screen/home_screen.dart';
import 'package:grabpanda1/Screens/Register_Screen/register_screen.dart';
import 'package:grabpanda1/Screens/Reset_Password/Reset_Email/reset_email_screen.dart';

import 'login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();

  String? email;
  String? name;
  String? password;
  String? phoneNumber;
  String? location;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());
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
                    height: Get.height * 0.14,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppImg.imgLogo,
                      height: 177,
                      width: 163,
                    ),
                  ),
                  Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.6,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "GrabPanda",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text:
                                'Please login to your account to continue with ',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'GrabPanda',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontSize: 13,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ])),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _loginFormKey,
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
                                  Radius.circular(15),
                                ),
                              ),
                              hintStyle: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "Email",
                              suffixIcon: const Icon(
                                Icons.email,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
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
                                textStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "Password",
                              suffixIcon: const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            right: 21,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: Get.height *0.07,
                            width: Get.width * 0.85,
                            child: ElevatedButton(
                              onPressed: () async {
                                _loginFormKey.currentState?.save();
                                // final result = await controller.signin(
                                //     email: email, password: password);
                                // if (result == true) {
                                //   print("Lgok");
                                //   Get.to(BottomBarScreen());
                                // } else {
                                //   print("lgLoi");
                                // }
                                controller.login(email, password);
                              },
                              child: Text(
                                "Sign Up",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Colors.white,
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
                          height: 5,
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Or",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Colors.grey,
                                  fontSize: 17
                                ),),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: Get.height *0.06,
                                  width: Get.width * 0.37,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(ResetEmailScreen());
                                    },
                                    child: Text(
                                      "facebook",
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 26,
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: Get.height *0.06,
                                  width: Get.width * 0.37,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Google",
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 67,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(RegisterScreen());
                                  },
                                  child: Text(
                                    "Register Now",
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.lightBlue,
                                    ),
                                  ))
                            ],
                          ),
                        )
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
