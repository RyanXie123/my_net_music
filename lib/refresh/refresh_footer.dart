import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_net_music/res/r.dart';
import 'package:my_net_music/res/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(builder: ((context, mode) {
      Widget footer;
      if (mode == LoadStatus.idle) {
        ///下拉提示
        footer = const Text(
          '上拉加载',
          style: Style.b8c0d414,
        );
      } else if (mode == LoadStatus.loading) {
        footer = Lottie.asset(
          R.lottie.refreshFooter,
          width: 200,
          animate: true,
        );
      } else if (mode == LoadStatus.failed) {
        ///加载失败
        footer = const Text(
          '加载失败',
          style: Style.b8c0d414,
        );
      } else {
        footer = const Text(
          '没有更多数据',
          style: Style.b8c0d414,
        );
      }
      return SizedBox(
        height: 60,
        child: Center(
          child: footer,
        ),
      );
    }));
  }
}
