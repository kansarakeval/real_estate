import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:real_estate/screen/explore/view/explore_screen.dart';
import 'package:real_estate/screen/home/view/home_screen.dart';
import 'package:real_estate/screen/profile/view/profile.dart';
import 'package:real_estate/util/color.dart';

import '../controller/dash_controller.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  List<Widget> screen = [
    const HomeScreen(),
    const ExploreScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  DashController controller = DashController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
              () => PageView(
            controller: controller.pageController.value,
            onPageChanged: (value) {
              controller.screenIndex.value = value;
            },
            children: screen,
          ),
        ),
        bottomNavigationBar: Obx(
              () => NavigationBar(
            indicatorColor: blue,
            selectedIndex: controller.screenIndex.value,
            onDestinationSelected: (value) {
              controller.pageController.value.animateToPage(value,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn);
              controller.screenIndex.value = value;
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: "home"),
              NavigationDestination(
                  icon: Icon(Icons.explore_outlined), label: "Explore"),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border), label: "Favoverite"),
              NavigationDestination(
                  icon: Icon(Icons.person_outline), label: "Profile"),
            ],
            animationDuration: const Duration(microseconds: 1000),
          ),
        ),
      ),
    );
  }
}
