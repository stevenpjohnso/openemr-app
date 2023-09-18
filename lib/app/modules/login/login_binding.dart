import 'package:get/get.dart';
import 'package:openemr/app/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
