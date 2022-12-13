import 'package:flutter/cupertino.dart';

Widget buildList<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Widget Function(T item, int index)? separatorBuilder,
  Function(T item, int index)? onItemTap,
  ScrollPhysics? physics,
  bool shirinkWrap = false,
  EdgeInsetsGeometry? padding,
  Axis scrollDirection = Axis.vertical,
}) {
  return ListView.separated(
    itemBuilder: ((context, index) {
      return GestureDetector(
        onTap: (() => onItemTap?.call(items[index], index)),
        child: itemBuilder(items[index], index),
      );
    }),
    separatorBuilder: ((context, index) {
      return separatorBuilder?.call(items[index], index) ?? const SizedBox();
    }),
    itemCount: items.length,
    physics: physics,
    shrinkWrap: shirinkWrap,
    padding: padding ?? EdgeInsets.zero,
    scrollDirection: scrollDirection,
  );
}

SliverList builderSliverList<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Function(T item, int index)? onItemTap,
}) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (context, index) {
      return GestureDetector(
        onTap: () => onItemTap?.call(items[index], index),
        child: itemBuilder(items[index], index),
      );
    },
    childCount: items.length,
  ));
}
