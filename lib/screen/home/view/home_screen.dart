import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/favorite/controller/favorite_controller.dart';
import 'package:real_estate/screen/favorite/model/db_model.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/util/color.dart';
import 'package:real_estate/util/helper/db_helper.dart';
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
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  country(name: "All", sortType: 0),
                  SizedBox(width: 10,),
                  country(name: "A-Z", sortType: 1),
                  SizedBox(width: 10,),
                  country(name: "Z-A", sortType: 2),
                  SizedBox(width: 10,),
                  country(name: "Low to High", sortType: 3),
                  SizedBox(width: 10,),
                  country(name: "High to Low", sortType: 4),

                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.homeList.value == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.homeList.value.length,
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
                                  const EdgeInsets.only(left: 5, right: 5, top: 10),
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
                                          "http://192.168.1.34/real%20estate/images/${controller.homeList.value![index].image}",
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
                                      IconButton(
                                        onPressed: () {
                                          int? id = int.tryParse(controller.homeList.value[index].id!);
                                          DbModel dbModel = DbModel(
                                            name: controller.homeList.value[index].name,
                                            image: controller.homeList.value[index].image,
                                            email: controller.homeList.value[index].email,
                                            mobile: controller.homeList.value[index].mobile,
                                            rating: controller.homeList.value[index].rating,
                                            city: controller.homeList.value[index].city,
                                            description: controller.homeList.value[index].description,
                                            price: controller.homeList.value[index].price,
                                          );
                                          DbHelper.dbHelper.insertRealData(dbModel);
                                          favoriteController.favoriteGetData();
                                        },
                                        icon: Icon(Icons.favorite_border),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${controller.homeList.value[index].price}",
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
                                        "${controller.homeList.value[index].city}",
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
                                        "${controller.homeList.value[index].rating}",
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
          ],
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

  ActionChip country({required String name, required int sortType}) {
    return ActionChip(
      label: Text(name),
      onPressed: () {
        controller.sortBy.value = sortType;
        controller.sortData();
      },
    );
  }
}
