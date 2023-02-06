import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/base/controller/get_state_controller.dart';
import 'package:my_net_music/ui/dialog/page_loading.dart';

abstract class GetStateView<C extends GetStateController, S>
    extends StatefulWidget {
  const GetStateView({super.key});

  C get controller => GetInstance().find<C>();

  @protected
  Widget build(BuildContext context, S data);
  @override
  State<GetStateView> createState() => _GetStateViewState();
}

class _GetStateViewState extends State<GetStateView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.controller.obx(
      ((S) => widget.build(context, S)),
      onLoading: const PageLoading(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
