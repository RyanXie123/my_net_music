import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/ui/page/login/controller.dart';
import 'package:video_player/video_player.dart';

Scaffold loginBg({required Widget child}) {
  return Scaffold(
    body: Stack(children: [
      GetBuilder<LoginController>(
        builder: (controller) => VideoPlayer(controller.videoController),
      ),
      child
    ]),
  );
}

Widget loginTitle({required LoginController controller}) {
  return Obx((() => Text(
        controller.isPhone.value ? '手机号登录' : '账号密码登录',
        style: Style.puhui30whitebold,
      )));
}

Widget loginInputArea({required List<Widget> children}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    ),
  );
}
