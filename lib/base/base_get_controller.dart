import 'package:get/get.dart';
import 'package:my_net_music/http/request_respository.dart';

class BaseGetController extends GetxController {
  late RequestRepository respository;
  @override
  void onInit() {
    respository = Get.find<RequestRepository>();
    super.onInit();
  }
}
