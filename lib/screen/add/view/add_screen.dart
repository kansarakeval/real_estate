import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/screen/add/controller/add_controller.dart';
import 'package:real_estate/screen/home/controller/home_controller.dart';
import 'package:real_estate/util/helper/api_helper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtRating = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  HomeController controller = Get.put(HomeController());
  AddController imagePickerController = Get.put(AddController());

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }

  String? _validateRating(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a rating';
    }
    final rating = double.tryParse(value);
    if (rating == null || rating < 0 || rating > 5) {
      return 'Please enter a rating between 0 and 5';
    }
    return null;
  }

  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a city';
    }
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a description';
    }
    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Please enter a valid price';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: txtName,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline)),
                    validator: _validateName,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtEmail,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined)),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtMobile,
                    decoration: const InputDecoration(
                        labelText: 'Mobile',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.call_outlined)),
                    validator: _validateMobile,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtRating,
                    decoration: const InputDecoration(
                        labelText: 'Rating',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.star_half_outlined)),
                    validator: _validateRating,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtCity,
                    decoration: const InputDecoration(
                        labelText: 'City',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on_outlined)),
                    validator: _validateCity,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtDescription,
                    decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description_outlined)),
                    validator: _validateDescription,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: txtPrice,
                    decoration: const InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.currency_rupee)),
                    validator: _validatePrice,
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    final image = imagePickerController.image.value;
                    return image == null
                        ? const Text('No image selected.')
                        : Image.file(image);
                  }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: imagePickerController.pickImage,
                      child: const Text("Pick Image")),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final image = imagePickerController.image.value;
                          if (image != null) {
                            await APIHelper.apiHelper.addApi(
                                txtName.text,
                                image.path,
                                txtEmail.text,
                                txtMobile.text,
                                txtRating.text,
                                txtCity.text,
                                txtDescription.text,
                                txtPrice.text);
                            controller.gethome();
                            Get.offAllNamed("dash");
                            txtName.clear();
                            txtEmail.clear();
                            txtMobile.clear();
                            txtRating.clear();
                            txtCity.clear();
                            txtDescription.clear();
                            txtPrice.clear();
                            imagePickerController.clearImage();
                          } else {
                            Get.snackbar('Error', 'Please select an image');
                          }
                        }
                      },
                      child: const Text("ADD")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
