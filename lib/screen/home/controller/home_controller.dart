// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:real_estate/screen/home/model/home_model.dart';
// import 'package:real_estate/util/helper/api_helper.dart';
//
// class HomeController extends GetxController{
//   Rxn<List<HomeModel>> homeList = Rxn<List<HomeModel>>();
//
//   Future<void> gethome() async {
//     List<HomeModel>? list = await APIHelper.apiHelper.homeApi();
//     homeList.value = list;
//   }
//
//   Future<void> getDelete(String id) async {
//     await APIHelper.apiHelper.deleteApi(id);
//     gethome();
//   }
//
// }

import 'package:get/get.dart';
import 'package:real_estate/screen/home/model/home_model.dart';
import 'package:real_estate/util/helper/api_helper.dart';

class HomeController extends GetxController {
  Rx<List<HomeModel>> homeList = Rx<List<HomeModel>>([]);
  Rx<int> sortBy = 0.obs;

  Future<void> gethome() async {
    List<HomeModel>? list = await APIHelper.apiHelper.homeApi();
    homeList.value = list!;
  }

  Future<void> getDelete(String id) async {
    await APIHelper.apiHelper.deleteApi(id);
    gethome();
  }

  void sortData() {
    if (sortBy.value == 1) {
      homeList.value.sort((a, b) => a.name!.compareTo(b.name!));
    } else if (sortBy.value == 2) {
      homeList.value.sort((a, b) => b.name!.compareTo(a.name!));
    } else if (sortBy.value == 3) {
      homeList.value.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (sortBy.value == 4) {
      homeList.value.sort((a, b) => b.price!.compareTo(a.price!));
    }
    homeList.refresh();
  }
}