import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:real_estate/util/helper/api_helper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtRating = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Real Estate Edit"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: txtName,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtEmail,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtMobile,
                  decoration: const InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.call_outlined)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtRating,
                  decoration: const InputDecoration(
                      labelText: 'Rating',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.star_half_outlined)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtCity,
                  decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on_outlined)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.description_outlined)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtPrice,
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.currency_rupee)),
                ),
                const SizedBox(height: 10),
                _image == null
                    ? Text('No image selected.')
                    : Image.file(_image!),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text("Pick Image")),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      if (_image != null) {
                        APIHelper.apiHelper.addApi(
                            txtName.text,
                            _image!.path,
                            txtEmail.text,
                            txtMobile.text,
                            txtRating.text,
                            txtCity.text,
                            txtDescription.text,
                            txtPrice.text);
                        Get.back();
                        txtName.clear();
                        txtEmail.clear();
                        txtMobile.clear();
                        txtRating.clear();
                        txtCity.clear();
                        txtDescription.clear();
                        txtPrice.clear();
                      } else {
                        Get.snackbar('Error', 'Please select an image');
                      }
                    },
                    child: const Text("ADD")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
