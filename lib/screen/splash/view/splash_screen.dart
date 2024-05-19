import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/util/helper/fireauth_helper.dart';
import 'package:real_estate/util/helper/sharehelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? introStatus;

  @override
  void initState() {
    super.initState();
    bool isLogin = FireAuthHelper.fireAuthHelper.checkUser();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(
          introStatus == false || introStatus == null ? 'intro' : isLogin == false
              ? 'signIn'
              : 'dash'),
    );
    data();
  }

  Future<void> data() async {
    ShareHelper shr = ShareHelper();
    introStatus = await shr.getIntroStatus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "asset/img/logo.png",
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
