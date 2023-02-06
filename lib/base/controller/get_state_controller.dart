import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_net_music/base/controller/base_get_controller.dart';
import 'package:my_net_music/typedef/function.dart';

abstract class GetStateController<S> extends BaseGetController
    with StateMixin<S> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();

    request((S) => change(S, status: RxStatus.success()),
        (msg) => change(null, status: RxStatus.error(msg)));
  }

  void request(ParamCallback<S> success, Fail? fail);
}
