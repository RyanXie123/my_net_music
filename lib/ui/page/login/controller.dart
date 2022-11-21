import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/r.dart';
import 'package:video_player/video_player.dart';

class LoginController extends GetxController {
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

  login() {}
}
