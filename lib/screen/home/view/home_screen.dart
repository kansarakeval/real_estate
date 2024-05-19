import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    controller.gethome();
  }
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: controller.homeList.length,
          itemBuilder: (context, index) {
          return Text("${controller.homeList[index].email}");
        },),
      ),
    );
  }
}
