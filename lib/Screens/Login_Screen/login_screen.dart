import 'package:flutter/material.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Routers/routers.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:grabpanda/Screens/Home_Screen/home_screen.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen_controller.dart';
import 'package:grabpanda/Screens/Register_Screen/register_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Email/reset_email_screen.dart';

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
                  const SizedBox(
                    height: 79,
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
                    height: 48,
                    width: 187,
                    child: const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "GrabPanda",
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Container(
                    height: 35,
                    width: 340,
                    margin: const EdgeInsets.only(
                      left: 5 ,
                      right: 5,
                    ),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'Please login to your account to continue with ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: 'GrabPanda',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ]
                        )),
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
                              hintText: "Email",
                              suffixIcon: Icon(
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
                              hintText: "Password",
                              suffixIcon: Icon(
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
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey,
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
                            height: 40,
                            width: 268,
                            child: ElevatedButton(
                              onPressed: () async {
                                _loginFormKey.currentState?.save();
                                final result = await controller.signin(
                                    email: email, password: password);
                                if (result == true) {
                                  print("Lgok");
                                  Get.to(HomeScreen());
                                } else {
                                  print("lgLoi");
                                }
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
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
                          child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
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
                                  height: 31,
                                  width: 121,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(ResetEmailScreen());
                                    },
                                    child: const Text(
                                      "facebook",
                                      style: TextStyle(color: Colors.white),
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
                                  height: 31,
                                  width: 121,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Google",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.red),
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
                              const Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Get.to(RegisterScreen());
                                  },
                                  child: const Text(
                                    "Register Now",
                                    style: TextStyle(color: Colors.lightBlue),
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
