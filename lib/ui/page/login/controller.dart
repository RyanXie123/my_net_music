import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_net_music/base/controller/base_get_controller.dart';

import 'package:my_net_music/res/r.dart';
import 'package:my_net_music/routes/app_routes.dart';
import 'package:my_net_music/utils/sp_util.dart';
import 'package:my_net_music/utils/toast_util.dart';
import 'package:video_player/video_player.dart';

class LoginController extends BaseGetController {
  final phoneController = TextEditingController();
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  late VideoPlayerController videoController;

  final isPhone = false.obs;
  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.asset(R.videos.loginVideo)
      ..initialize().then((value) {
        videoController.setLooping(true);
        videoController.play();
        update();
      });
  }

  login() {
    var account = accountController.text.trim();
    var password = passwordController.text.trim();
    if (account.isEmpty || password.isEmpty) {
      ToastUtil.show('请输入账号密码');
      return;
    }
    if (account.endsWith("@163.com")) {
    } else {
      repository.phoneLogin(
        phone: account,
        password: password,
        success: (data) {
          SpUtil.cookie = data;
          ToastUtil.show('登录成功');
          Get.offAllNamed(Routes.index);
        },
        fail: (msg) => ToastUtil.show(msg),
      );
    }
  }
}
