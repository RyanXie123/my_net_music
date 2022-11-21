import 'package:flutter/material.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/ui/page/login/controller.dart';
import 'package:my_net_music/widgets/text_edit.dart';
class PhoneLogin extends StatelessWidget {
  const PhoneLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '国家地区 中国',
          style: Style.white20,
        ),
        vBox(12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '+86',
              style: Style.white20,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextEditWidget(
                controller: controller.phoneController,
                hintText: '输入手机号',
                isNumber: true,
              ),
            ))
          ],
        )
      ],
    );
  }
}