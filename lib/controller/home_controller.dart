import 'package:app/core/networking/app_api.dart';
import 'package:app/model/category/list_category_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as di;

class HomeController extends GetxController {
  di.Dio dio = di.Dio();
  ListCategoryModel? listCategoryModel;
  Future<ListCategoryModel?> getAllCategory() async {
    try {
      di.Response response = await dio.get(
        AppApi.categoryUrl,
      );
      if (response.statusCode == 200) {
        listCategoryModel = ListCategoryModel.fromJson(response.data);
        return listCategoryModel;
      }
    } catch (error) {
      return null;
    }
  }
  
}
