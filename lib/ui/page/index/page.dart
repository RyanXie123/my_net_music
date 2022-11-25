import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/r.dart';
import 'package:my_net_music/theme/widgets/theme_background.dart';
import 'package:my_net_music/ui/page/index/controller.dart';

import 'widget/bottom_item.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView.builder(
              itemBuilder: (context, index) {
                return controller.pageList[index];
              },
              itemCount: controller.pageList.length,
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(R.images.btmBg),
                        fit: BoxFit.fitWidth)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(controller.items.length, (index) {
                    var item = controller.items[index];
                    return BottomItem(
                      controller: controller,
                      index: index,
                      onTap: () => controller.onItemTap(index),
                      item: item,
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
