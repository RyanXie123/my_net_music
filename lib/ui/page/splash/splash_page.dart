import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_net_music/res/r.dart';
import 'package:my_net_music/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;

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
        Get.offAndToNamed(Routes.login);
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
}
