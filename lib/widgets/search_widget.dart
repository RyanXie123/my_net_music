import 'package:flutter/material.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/res/color_style.dart';
import 'package:my_net_music/res/style.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    this.height = 40,
    this.hintText,
    this.autofocus,
    this.onChanged,
    this.onSubbmitted,
    this.controller,
    this.onTap,
    this.onEdiingComplete,
  }) : super(key: key);

  final double? height;
  final String? hintText;
  final bool? autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubbmitted;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? onEdiingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorStyle.E0E6FD66,
        borderRadius: BorderRadius.circular(height! / 2),
      ),
      child: Row(
        children: [
          hBox(10.0),
          const Icon(
            Icons.search,
            color: ColorStyle.B8C0D4,
            size: 24.0,
          ),
          hBox(10.0),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubbmitted,
              onTap: onTap,
              onEditingComplete: onEdiingComplete,
              autofocus: autofocus ?? false,
              style: Style.f3f3f316,
              decoration: InputDecoration(
                hintText: hintText ?? "搜索",
                border: InputBorder.none,
                hintStyle: Style.b8c0d414,
              ),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
