import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:my_net_music/models/recom_play_entity.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/res/color_style.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/theme/widgets/theme_adapter.dart';
import 'package:my_net_music/theme/widgets/theme_container.dart';
import 'package:my_net_music/theme/widgets/theme_text.dart';
import 'package:my_net_music/ui/page/discover_module/discover/widget/recom_top.dart';
import 'package:my_net_music/widgets/border_image.dart';
import 'package:my_net_music/widgets/custom_list/build_list.dart';
import 'package:my_net_music/widgets/custom_list_tile.dart';
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
              child: vBox(18),
            ),

            ///推荐歌单顶部
            const RecomTop(
              title: "推荐歌单",
            ),
            SliverToBoxAdapter(
              child: vBox(6),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: buildList<RecomPlayListEntity>(
                    scrollDirection: Axis.horizontal,
                    shirinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    separatorBuilder: (item, index) => hBox(20),
                    itemBuilder: ((item, index) {
                      return SizedBox(
                        width: 140,
                        height: 140,
                        child: Column(
                          children: [BorderImage(url: item.picUrl, border: 10)],
                        ),
                      );
                    }),
                    items: controller.recomPlays),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: buildList(
                  shirinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (item, index) => hBox(10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemBuilder: ((item, index) {
                    return SizedBox(
                      width: 140,
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BorderImage(
                            url: item.picUrl,
                            border: 10,
                            fit: BoxFit.fitWidth,
                          ),
                          ThemeText(
                            item.name,
                            style: Style.f3f3f316,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  }),
                  items: controller.recomPlays,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: vBox(6),
            ),

            ///推荐歌曲
            const RecomTop(title: '推荐歌曲'),

            ///推荐歌曲列表
            ///
            builderSliverList(
                itemBuilder: ((item, index) {
                  return CustomListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: BorderImage(
                      url: item.picUrl,
                      border: 10,
                      fit: BoxFit.cover,
                      width: 50,
                    ),
                    title: item.name,
                    subtitle: item.artistName,
                  );
                }),
                items: controller.newSongs)
          ],
        ));
  }
}
