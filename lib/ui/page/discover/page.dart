import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('DiscoverPage')),
        body: SafeArea(child: Text('DiscoverController')));
  }
}
