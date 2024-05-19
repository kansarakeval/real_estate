import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/util/color.dart';
import 'package:real_estate/util/constant.dart';
import 'package:real_estate/util/helper/fireauth_helper.dart';
import 'package:real_estate/util/text_theme.dart';
import 'package:real_estate/util/widget/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  Image.asset("asset/img/Sign up-pana.png",height: 250,),
                  Text(
                    registrationtitle,
                    style: textBold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: name,
                    iconData: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: email,
                    controller: txtEmail,
                    iconData: Icons.email_outlined,
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
                  CustomTextField(
                    label: confirmPassword,
                    iconData: Icons.password,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      String msg = await FireAuthHelper.fireAuthHelper.signUp(
                          email: txtEmail.text, password: txtPassword.text);
                      Get.back();
                      Get.snackbar(msg, "");
                    },
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          registrationButton,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
