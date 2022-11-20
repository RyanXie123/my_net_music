import 'package:get/get.dart';
import 'package:my_net_music/ui/page/login/controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
