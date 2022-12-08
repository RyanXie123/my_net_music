import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/http/request_respository.dart';
import 'package:my_net_music/res/r.dart';
import 'package:my_net_music/routes/app_routes.dart';
import 'package:my_net_music/utils/sp_util.dart';
import 'package:my_net_music/utils/toast_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;
  final request = Get.find<RequestRepository>();
  @override
  void initState() {
    _tween = Tween(begin: 0, end: 1);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..drive(_tween);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(milliseconds: 300), (() {
      _controller.forward();
    }));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (SpUtil.checkLogin) {
          Get.offAllNamed(Routes.index);
        } else {
          Get.offAndToNamed(Routes.login);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("splash")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                '云音乐app',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: R.fonts.PuHuiTi),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ScaleTransition _buildLogo() {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(R.images.logo),
    );
  }

  void _intentPage() {
    if (SpUtil.checkLogin) {
      request.refreshLogin(
        success: (data) {
          Get.offAllNamed(Routes.index);
        },
        fail: (msg) {
          Get.offAndToNamed(Routes.login);
          ToastUtil.show('登录已过期，请重新登录');
        },
      );
    } else {
      Get.offAndToNamed(Routes.index);
    }
  }
}
