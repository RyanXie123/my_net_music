import 'package:flutter/material.dart';

Widget builder<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Widget Function(T item, int index)? separatorBuilder,
  Function(T item, int index)? onItemTap,
  ScrollPhysics? phyics,
  bool shringWrap = false,
  EdgeInsetsGeometry? padding,
  Axis scrollDirection = Axis.vertical,
}) {
  return ListView.builder(
    itemBuilder: ((context, index) {
      return GestureDetector(
        onTap: () => onItemTap?.call(items[index], index),
        child: itemBuilder(items[index], index),
      );
    }),
  );
}
