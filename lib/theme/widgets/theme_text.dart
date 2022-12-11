import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_net_music/theme/theme_controller.dart';

class ThemeText extends GetView<ThemeController> {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDirection? direction;

  const ThemeText(
    this.text, {
    super.key,
    required this.style,
    this.textAlign,
    this.overflow,
    this.direction,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Obx((() => Text(
          text,
          style: style.copyWith(color: controller.fontColor.value),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          textDirection: direction,
        )));
  }
}
