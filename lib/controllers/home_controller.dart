import 'package:get/get.dart';
import 'package:groceryapp/models/banner_model.dart';
import 'package:groceryapp/models/category_model.dart';
import 'package:groceryapp/services/remote_service/remote_banner_service.dart';
import 'package:groceryapp/services/remote_service/remote_category_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<BannerModel> bannerList = List<BannerModel>.empty(growable: true).obs;
  RxList<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;
  final RxBool _isBannerLoading = false.obs;
  final RxBool _isCategoryLoading = false.obs;

  @override
  void onInit() {
    getBannerModel();
    getCategoryModel();
    super.onInit();
  }

  void getBannerModel() async {
    try {
      _isBannerLoading(true);
      var result = await RemoteBannerService().get();
      // print(result.body);
      if (result != null) {
        // print(result.body);

        // print(bannerModelListFromJson(result.body));
        // bannerList.add(bannerModelListFromJson(result.body));
        // bannerList = List<BannerModel>.empty(growable: true).obs;

        bannerList.assignAll(bannerModelListFromJson(result.body));
        // print(result.body);
      }
    } catch (error) {
      print(error);
    } finally {
      // print(bannerList.first.image);
      // print(bannerModelListFromJson(result.body).toList());
      _isBannerLoading(false);
    }
  }

  void getCategoryModel() async {
    try {
      _isCategoryLoading(true);
      var result = await RemoteCategoryService().get();

      if (result != null) {
        categoryList.assignAll(categoryModelListFromJson(result.body));
      }
    } catch (error) {
      print(error);
    } finally {
      print(categoryList.length);
      _isCategoryLoading(false);
    }
  }
}
