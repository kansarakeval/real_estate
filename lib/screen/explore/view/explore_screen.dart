// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/screen/home/controller/home_controller.dart';
// import 'package:real_estate/util/text_theme.dart';
//
// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }
//
// class _ExploreScreenState extends State<ExploreScreen> {
//   HomeController controller = Get.put(HomeController());
//
//   @override
//   void initState() {
//     super.initState();
//     controller.gethome();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Obx(() {
//           if (controller.homeList.value == null) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           final cities = controller.homeList.value!
//               .map((home) => home.city)
//               .toSet()
//               .toList();
//
//           return ListView.builder(
//             itemCount: cities.length,
//             itemBuilder: (context, index) {
//               var city = cities[index];
//               return ListTile(
//                 title: Text(
//                   city!,
//                   style: text15,
//                 ),
//                 trailing: Icon(Icons.navigate_next),
//               );
//             },
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/city%20home/view/city_home_screen.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/util/text_theme.dart';

class ExploreScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  ExploreScreen({Key? key}) : super(key: key) {
    controller.gethome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.homeList.value == null) {
            return Center(child: CircularProgressIndicator());
          }

          final cities = controller.homeList.value!
              .map((home) => home.city)
              .toSet()
              .toList();

          return ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              var city = cities[index];
              return ListTile(
                title: Text(
                  city!,
                  style: text15,
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Get.to(() => CityHomesScreen(city: city));
                },
              );
            },
          );
        }),
      ),
    );
  }
}
