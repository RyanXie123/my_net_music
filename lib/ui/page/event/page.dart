import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class EventPage extends GetView<EventController> {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('EventPage')),
        body: SafeArea(child: Text('EventController')));
  }
}
