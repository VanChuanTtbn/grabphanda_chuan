import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grabpanda/Commons/app_img.dart';
import 'package:grabpanda/Controller/controller.dart';
import 'package:grabpanda/Screens/Register_Screen/register_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Reset_Password/reset_pasword_screen.dart';
import 'package:grabpanda/Screens/Reset_Password/Veryfi_Screen/veryfi_screen.dart';

class ResetEmailScreen extends StatelessWidget {
  final _rsEmailFormKey = GlobalKey<FormState>();
  String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseController());
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
                      height: 159,
                      width: 146,
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
                    height: 50,
                    width: 340,
                    child: Column(
                      children: const [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Enter your email address below & we’ll send you an email with Instruction on how change your Password",
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: 40,
                            width: 268,
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
                              child: const Text(
                                "Send Mail",
                                style: TextStyle(color: Colors.white),
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
