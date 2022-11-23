import 'package:get/get.dart';
import 'package:my_net_music/ui/page/index/controller.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
  }
}
