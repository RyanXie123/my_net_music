import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/ui/page/index/controller.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key? key,
    required this.controller,
    required this.item,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final int index;
  final IndexController controller;
  final VoidCallback onTap;
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () {
          return Stack(
            children: [
              Image.asset(controller.pageSelect.value == index
                  ? item["imagePrs"]!
                  : item["image"]!),
              Positioned(
                left: 20,
                bottom: 5,
                child: Text(
                  item['title']!,
                  style: TextStyle(
                    color: controller.pageSelect.value == index
                        ? Colors.white
                        : Colors.white54,
                    fontSize: 10,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
