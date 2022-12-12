import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_net_music/theme/theme_controller.dart';

class ThemeAdapter extends GetView<ThemeController> {
  final Widget Function(ThemeController) builder;

  const ThemeAdapter({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return builder(controller);
    });
  }
}
