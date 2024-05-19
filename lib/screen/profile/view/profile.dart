import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/util/color.dart';
import 'package:real_estate/util/constant.dart';
import 'package:real_estate/util/helper/fireauth_helper.dart';
import 'package:real_estate/util/text_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: blue,
      ),
      body: ListTile(
        onTap: () async {
          await FireAuthHelper.fireAuthHelper.signOut();
          Get.offAllNamed('signIn');
        },
        leading: Icon(Icons.login),
        title: Text(logOut,style: text15,),
        trailing: Icon(Icons.navigate_next),
      ),
    ),
    );
  }
}
