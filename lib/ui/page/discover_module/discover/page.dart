import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/res/color_style.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/widgets/search_widget.dart';

import 'controller.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Icon(
                Icons.menu,
                color: ColorStyle.F3F3F3,
              ),
              centerTitle: true,
              title: SearchWidget(),
              actions: [
                IconButton(
                    onPressed: (() {}),
                    icon: Icon(
                      Icons.keyboard_voice,
                      color: ColorStyle.F3F3F3,
                    ))
              ],
            ),
            SliverToBoxAdapter(
              child: GetBuilder<DiscoverController>(
                builder: (controller) {
                  return Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    height: 150,
                  );
                },
              ),
            )
          ],
        ));
  }
}
