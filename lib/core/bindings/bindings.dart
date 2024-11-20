import 'package:app/controller/home_controller.dart';
import 'package:app/controller/login_controller.dart';
import 'package:app/controller/profile_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    );
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => ProfileController(),
    );
    //  Get.put(LoginController());
  }
}
