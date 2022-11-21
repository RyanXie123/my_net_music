import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/box.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/ui/page/login/widget/account_login.dart';
import 'package:my_net_music/ui/page/login/widget/login_button.dart';
import 'package:my_net_music/ui/page/login/widget/login_function.dart';
import 'package:my_net_music/ui/page/login/widget/phone_login.dart';
import 'package:my_net_music/widgets/gradient_button.dart';
import 'package:my_net_music/widgets/text_edit.dart';
import 'controller.dart';
import 'package:my_net_music/res/box.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return loginBg(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loginTitle(controller: controller),
            loginInputArea(children: [
              Obx((() {
                if (controller.isPhone.value) {
                  return PhoneLogin(controller: controller);
                } else {
                  return AccountLogin(controller: controller);
                }
              })),
            ]),
            vBox(15),
            LoginButton(
              onTap: controller.login,
            ),
            vBox(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginType(controller: controller),
                Obx((() => controller.isPhone.value
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () {},
                        child: Text(
                          '忘记密码',
                          style: Style.puhui15grey,
                        ),
                      ))),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class LoginType extends StatelessWidget {
  const LoginType({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.isPhone.value = !controller.isPhone.value,
      child: Obx((() => Text(
            controller.isPhone.value ? '账号密码登录' : '手机验证码登录',
            style: Style.puhui15white,
          ))),
    );
  }
}
