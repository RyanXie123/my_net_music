import 'package:get/get.dart';
import 'package:my_net_music/base/play_music_controller.dart';
import 'package:my_net_music/http/request_respository.dart';
import 'package:my_net_music/theme/theme_controller.dart';

class Inject {
  static void init() {
    Get.put(RequestRepository());
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<PlayMusicController>(() => PlayMusicController());
  }
}
