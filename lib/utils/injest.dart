import 'package:get/get.dart';
import 'package:my_net_music/http/request_respository.dart';

class Inject {
  static void init() {
    Get.put(RequestRepository());
  }
}
