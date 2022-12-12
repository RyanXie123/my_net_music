import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/res/color_style.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/theme/widgets/theme_adapter.dart';
import 'package:my_net_music/theme/widgets/theme_container.dart';
import 'package:my_net_music/theme/widgets/theme_text.dart';
import 'package:my_net_music/widgets/border_image.dart';
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
                    child: Swiper(
                      itemCount: controller.banners.length,
                      key: GlobalKey(),
                      itemBuilder: (BuildContext context, int index) {
                        return BorderImage(
                          border: 10,
                          url: controller.banners[index],
                        );
                      },
                      pagination: const SwiperPagination(),
                      autoplay: true,
                      controller: SwiperController(),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: vBox(20),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(controller.buttons.length, (index) {
                    var item = controller.buttons[index];
                    var onTap = item['onTap'];
                    var src = item['src'];
                    var title = item['title'];
                    String? day = item['day'];
                    return Column(
                      children: [
                        Stack(
                          children: [
                            ThemeContainer(
                              width: 60,
                              height: 60,
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(src),
                            ),
                            day == null
                                ? const SizedBox()
                                : Positioned(
                                    left: 24,
                                    top: 27,
                                    child: ThemeText(
                                      day,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ThemeText(
                            title,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ThemeText(
                      "推荐歌曲",
                      style: Style.white18,
                    ),
                    ThemeAdapter(builder: (controller) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: controller.fontColor.value,
                              width: 0.3,
                            )),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
