import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabpanda1/Models/Entity/account_entity.dart';
import 'package:grabpanda1/Screens/Bottom_Bar/bottom_bar.dart';
import 'package:grabpanda1/Screens/Login_Screen/login_screen.dart';
import 'package:grabpanda1/Screens/Register_Screen/register_screen_controller.dart';
import '../../Commons/app_img.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  String? email;
  String? name;
  String? password;
  String? phoneNumber;
  String? location;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterScreenController());

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.black,
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
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppImg.imgLogo,
                      height: 79,
                      width: 73,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(
                      left: 5 ,
                      right: 5,
                    ),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                        text: 'Give Us some of your information to get free Accesss to flieldly ',
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                            text: 'GrabPanda',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.lightBlue,
                            ),
                          ),
                        ]
                    )),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          child: TextFormField(
                            onSaved: (value) => name = value,
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
                              hintStyle:
                                  GoogleFonts.inter(
                                    textStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                                  ),
                              hintText: "Name",
                              suffixIcon: const Icon(
                                Icons.account_circle_outlined,
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
                              hintStyle:
                              GoogleFonts.inter(
                                textStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                              ),
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
                              hintStyle:
                              GoogleFonts.inter(
                                textStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "Password",
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
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
                            onSaved: (value) => phoneNumber = value,
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
                              hintStyle:
                              GoogleFonts.inter(
                                textStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "Phone number",
                              suffixIcon: const Icon(
                                Icons.phone_android,
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
                            onSaved: (value) => location = value,
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
                              hintStyle:
                              GoogleFonts.inter(
                                textStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                              ),
                              hintText: "Location",
                              suffixIcon: Icon(
                                Icons.not_listed_location_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                            Flexible(
                              child: RichText(text: TextSpan(
                                text: 'By signing up, you agree to the ',
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service and Privacy Policy',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ]
                              )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: Get.height * 0.07,
                            width: Get.width * 0.85,
                            child: ElevatedButton(
                              onPressed: () async {
                                _registerFormKey.currentState?.save();
                                // final registerAcc = await controller.checkAccount(
                                //   AccountEntity(
                                //     email: email,
                                //     password: password,
                                //     name: name,
                                //     phoneNumber: phoneNumber,
                                //     location: location,
                                //   ),
                                // );
                                // if (registerAcc == true) {
                                //   print('rsOK');
                                //   Get.to(LoginScreen());
                                // } else {
                                //   print('rsLoi');
                                // }
                                await controller.register(AccountEntity(
                                  name: name,
                                  email: email,
                                  password: password,
                                  phoneNumber: phoneNumber,
                                  location: location,
                                ));
                              },
                              child: Text(
                                "Register",
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Colors.white,
                                ),
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
                          height: 86,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
