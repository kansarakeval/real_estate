import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:real_estate/util/color.dart';
import 'package:real_estate/util/helper/sharehelper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: const Text(
                "Introduction Page",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/img/House searching-bro.png"),
                  const SizedBox(height: 20), // Spacing between image and text
                  const Text(
                    "Welcome to the real estate application",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: const Text(
                "Introduction Page",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/img/Build your home-bro.png"),
                  const SizedBox(height: 20), // Spacing between image and text
                  const Text(
                    "Welcome to the real estate booking system",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            PageViewModel(
              titleWidget: const Text(
                "Introduction Page",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/img/For sale-bro.png"),
                  const SizedBox(height: 20), // Spacing between image and text
                  const Text(
                    "Family smart home, digital home",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
          showDoneButton: true,
          onDone: () {
            ShareHelper shr = ShareHelper();
            shr.setIntroStatus();
            Get.offAllNamed('signIn');
          },
          done: const Text(
            "Done",
            style: TextStyle(color: Colors.white),
          ),
          next: Text(
            "Next",
            style: TextStyle(color: blue, fontSize: 18),
          ),
          skip: Text(
            "Skip",
            style: TextStyle(color: blue, fontSize: 18),
          ),
          showSkipButton: true,
          doneStyle:
              ButtonStyle(backgroundColor: MaterialStateProperty.all(blue)),
        ),
      ),
    );
  }
}
