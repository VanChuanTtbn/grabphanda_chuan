import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Models/Entity/user_entity.dart';
import 'package:grabpanda/Screens/Login_Screen/login_screen.dart';
import 'package:grabpanda/Screens/Register_Screen/register_screen_controller.dart';
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
    final controller = Get.put(BaseController());

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 74,
        title: const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Register",
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
                  const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Give Us some of your information to get free Accesss to flieldly GrabPanda",
                      )),
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
                              hintText: "Name",
                              suffixIcon: Icon(
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
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          child: TextFormField(
                            onSaved: (value) => phoneNumber = value,
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
                              hintText: "Phone number",
                              suffixIcon: Icon(
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
                            const Flexible(
                                child:
                                    Text("By signing up, you agree to the ")),
                            Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Terms of Sevice and Privacy Policy",
                                    style: TextStyle(
                                      color: Colors.lightBlue,
                                    ),
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
                            height: 40,
                            width: 268,
                            child: ElevatedButton(
                              onPressed: () async {
                                _registerFormKey.currentState?.save();
                                final registerAcc = await controller.checkUser(
                                  UserEntity(
                                    email: email,
                                    password: password,
                                    name: name,
                                    phoneNumber: phoneNumber,
                                    location: location,
                                  ),
                                );
                                if (registerAcc == true) {
                                  print('rsOK');
                                  Get.to(LoginScreen());
                                } else {
                                  print('rsLoi');
                                }
                              },
                              child: const Text(
                                "Register",
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
                        SizedBox(
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
