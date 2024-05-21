import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/util/color.dart';
import 'package:real_estate/util/text_theme.dart';

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
        body: Obx(
          () => controller.homeList.value == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.homeList.value!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Delete'),
                              content: const Text(
                                  'Are you sure you want to delete this data?'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      controller.getDelete(controller
                                          .homeList.value![index].id!);
                                      Get.back();
                                    },
                                    child: const Text("delete")),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("close")),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed('detail',
                                    arguments:
                                        controller.homeList.value![index]);
                              },
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "http://192.168.2.11/real%20estate/images/${controller.homeList.value![index].image}",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${controller.homeList.value![index].name}",
                                  style: textBold18,
                                ),
                                const Spacer(),
                                const Icon(Icons.favorite_border)
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${controller.homeList.value![index].price}",
                              style: text15,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                ),
                                Text(
                                  "${controller.homeList.value![index].city}",
                                  style: text15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.star_half,
                                  size: 15,
                                ),
                                Text(
                                  "${controller.homeList.value![index].rating}",
                                  style: text15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: blue,
          onPressed: () {
            Get.toNamed('add');
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
