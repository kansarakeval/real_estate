import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/util/text_theme.dart';

class CityHomesScreen extends StatelessWidget {
  final String city;

  CityHomesScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Obx(() {
        final cityHomes = controller.homeList.value!
            .where((home) => home.city == city)
            .toList();

        return ListView.builder(
          itemCount: cityHomes.length,
          itemBuilder: (context, index) {
            var home = cityHomes[index];
            return ListTile(
              title: Text(
                home.name!,
                style: text15,
              ),
              subtitle: Text(
                home.price!,
                style: text15,
              ),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Get.toNamed('detail', arguments: home);
              },
            );
          },
        );
      }),
    );
  }
}
