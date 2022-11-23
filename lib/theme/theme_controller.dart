import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/r.dart';

class ThemeController extends GetxController {
  final bgColor = Colors.white.obs;
   ///字体颜色
  final fontColor = Colors.white.obs;

  ///背景图
  final cover = R.images.appBackground.obs;

  ///背景图模糊度
  final coverBlur = 0.0.obs;

  ///控件颜色
  final widgetBgColor = Colors.white.obs;

  ///控件透明度
  final widgetOpacity = 0.1.obs;

  ///是否开启背景图
  final isImage = true.obs;
}
