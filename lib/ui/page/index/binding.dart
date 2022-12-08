import 'package:get/get.dart';
import 'package:my_net_music/ui/page/discover_module/discover/controller.dart';
import 'package:my_net_music/ui/page/event/controller.dart';
import 'package:my_net_music/ui/page/index/controller.dart';
import 'package:my_net_music/ui/page/mine/controller.dart';
import 'package:my_net_music/ui/page/video/controller.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<MineController>(() => MineController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<EventController>(() => EventController());
  }
}
