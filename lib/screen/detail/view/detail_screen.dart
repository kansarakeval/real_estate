import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/screen/home/model/home_model.dart';
import 'package:real_estate/util/text_theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeModel m1 = Get.arguments;

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "http://192.168.2.11/real%20estate/images/${m1.image}",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${m1.name}",
                  style: textBold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${m1.price}",
                  style: text15,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${m1.city}"),
                    const Spacer(),
                    const Icon(Icons.call_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${m1.mobile}"),
                    const Spacer(),
                    const Icon(Icons.mail_outline),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${m1.email}"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Properties Requirements",style: textBold18,),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(Icons.bed_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("4 Bedroom"),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(Icons.pool_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Swimming pool"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.bathtub_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("2 bathrooms"),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.directions_car_filled_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("2 car spaces"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.compost),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Compost"),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.sports_tennis),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sports Tennis"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Buyers notes",style: textBold18,),
                      SizedBox(height: 10,),
                      Text("${m1.description}"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
