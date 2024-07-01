import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/screen/favorite/controller/favorite_controller.dart';
import 'package:real_estate/util/helper/db_helper.dart';
import 'package:real_estate/util/text_theme.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteController controller = Get.put(FavoriteController());
  @override
  void initState() {
    super.initState();
    controller.favoriteGetData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.favoriteList.value == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.favoriteList.value!.length,
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
                                      DbHelper.dbHelper.deleteRealData(id: "${controller.favoriteList.value![index].id}");
                                      controller.favoriteGetData();
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
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "http://192.168.1.34/real%20estate/images/${controller.favoriteList.value![index].image}",
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${controller.favoriteList.value![index].name}",
                              style: textBold18,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${controller.favoriteList.value![index].price}",
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
                                  "${controller.favoriteList.value![index].city}",
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
                                  "${controller.favoriteList.value![index].rating}",
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
      ),
    );
  }
}
