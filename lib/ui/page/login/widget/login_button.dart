import 'package:flutter/material.dart';
import 'package:my_net_music/res/style.dart';
import 'package:my_net_music/ui/page/login/controller.dart';
import 'package:my_net_music/widgets/gradient_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key, required this.onTap,

  }) : super(key: key);


  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GradientButton(
      child: Text(
        '登录',
        style: Style.puhui20white,
      ),
      colors: [Colors.lightBlue.shade300, Colors.blueAccent],
      borderRadius: 25.0,
      onTap: onTap,
    );
  }
}
