import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_estate/screen/home/model/home_model.dart';
import 'package:real_estate/util/helper/api_helper.dart';

class HomeController extends GetxController{
  Rxn<List<HomeModel>> homeList = Rxn<List<HomeModel>>();

  Future<void> gethome() async {
    List<HomeModel>? list = await APIHelper.apiHelper.homeApi();
    homeList.value = list;
  }

  Future<void> getDelete(String id) async {

    await APIHelper.apiHelper.deleteApi(id);
    gethome();
  }

}