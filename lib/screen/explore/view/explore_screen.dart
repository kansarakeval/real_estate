import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/util/text_theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.gethome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
        itemCount: controller.homeList.value!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${controller.homeList.value![index].city}",
              style: text15,
            ),
            trailing: Icon(Icons.navigate_next),
          );
        },
      ),
    ));
  }
}
