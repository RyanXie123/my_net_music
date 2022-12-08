import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_net_music/base/base_get_controller.dart';

class DiscoverController extends BaseGetController with StateMixin {
  final banners = <String>[];

  @override
  void onInit() {
    super.onInit();

    getData();
  }

  getData() {
    respository.banner(success: ((data) {
      banners.addAll(data);
      update();
      change(null, status: RxStatus.success());
    }));
  }
}
