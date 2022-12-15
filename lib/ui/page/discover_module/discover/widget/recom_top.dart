import 'package:flutter/material.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/theme/widgets/theme_adapter.dart';
import 'package:my_net_music/theme/widgets/theme_text.dart';

class RecomTop extends StatelessWidget {
  const RecomTop({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThemeText(
              title,
              style: Style.white18,
            ),
            GestureDetector(
              onTap: () {},
              child: ThemeAdapter(builder: (controller) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: controller.fontColor.value,
                        width: 0.3,
                      )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '更多',
                        style: TextStyle(
                          fontSize: 14,
                          color: controller.fontColor.value,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: controller.fontColor.value,
                        size: 14,
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
