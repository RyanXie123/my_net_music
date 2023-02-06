import 'package:get/get.dart';
import 'package:my_net_music/http/request_respository.dart';

class BaseGetController extends GetxController {
  late RequestRepository repository;
  @override
  void onInit() {
    repository = Get.find<RequestRepository>();
    super.onInit();
  }
}
