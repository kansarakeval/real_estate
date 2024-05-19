import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/util/color.dart';
import 'package:real_estate/util/constant.dart';
import 'package:real_estate/util/helper/fireauth_helper.dart';
import 'package:real_estate/util/text_theme.dart';
import 'package:real_estate/util/widget/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("asset/img/Sign in-rafiki.png",height: 250,),
                  Text(
                    logintitle,
                    style: textBold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  CustomTextField(
                    label: email,
                    controller: txtEmail,
                    iconData: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: password,
                    controller: txtPassword,
                    iconData: Icons.password,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      forgetPassword,
                      style: text14,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () async {
                            String msg=await FireAuthHelper.fireAuthHelper.googleSignIn();
                            Get.snackbar(msg, "Login success fully");
                            if(msg=="success")
                            {
                              FireAuthHelper.fireAuthHelper.checkUser();
                              Get.offAllNamed('dash');
                            }
                          },
                          child: socialContainer("asset/img/google.png")),
                      InkWell(
                          onTap: () {
                            FireAuthHelper.fireAuthHelper.guestLogin();
                            Get.offAllNamed('dash');
                          },
                          child: socialContainer("asset/img/user.png")),
                      socialContainer("asset/img/apple-logo.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      String msg = await FireAuthHelper.fireAuthHelper.signIn(
                          email: txtEmail.text, password: txtPassword.text);
                      Get.snackbar(msg, "");
                      if (msg == "success") {
                        FireAuthHelper.fireAuthHelper.checkUser();
                        Get.offAllNamed('dash');
                      }
                    },
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(
                          child: Text(
                            loginButton,
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed('signUp');
                      },
                      child: Text(
                        createNewAccount,
                        style: text14,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container socialContainer(String path) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 48,
      width: 48,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Image.asset(
        path,
        height: 45,
        width: 45,
      ),
    );
  }
}
