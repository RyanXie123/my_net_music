import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return LoginBg(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    ));
  }

  Scaffold LoginBg({required Widget child}) {
    return Scaffold(
      body: Stack(children: [
        GetBuilder<LoginController>(
          builder: (controller) => VideoPlayer(controller.videoController),
        ),
        child
      ]),
    );
  }
}
