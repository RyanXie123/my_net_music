import 'package:flutter/material.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/ui/page/login/controller.dart';
import 'package:my_net_music/widgets/text_edit.dart';

class AccountLogin extends StatelessWidget {
  const AccountLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextEditWidget(
          hintText: '邮箱/手机号',
          controller: controller.accountController,
        ),
        vBox(12),
        TextEditWidget(
          hintText: '密码',
          controller: controller.passwordController,
          obscureText: true,
        )
      ],
    );
  }
}
