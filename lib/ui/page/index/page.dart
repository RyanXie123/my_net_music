import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/ui/page/index/controller.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('index'),
      ),
    );
  }
}
