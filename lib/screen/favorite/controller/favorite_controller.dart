import 'package:get/get.dart';
import 'package:real_estate/screen/favorite/model/db_model.dart';
import 'package:real_estate/util/helper/db_helper.dart';

class FavoriteController extends GetxController{
  RxList<DbModel> favoriteList = <DbModel>[].obs;

  Future<void> favoriteGetData()async{
    List<DbModel> like = await DbHelper.dbHelper.readRealData();
    favoriteList.value = like;
  }
}