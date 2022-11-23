import 'package:get/get.dart';
import 'package:my_net_music/ui/page/index/binding.dart';
import 'package:my_net_music/ui/page/index/page.dart';
import 'package:my_net_music/ui/page/login/binding.dart';
import 'package:my_net_music/ui/page/login/page.dart';
import 'package:my_net_music/ui/page/splash/splash_page.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const index = '/index';
  static final routes = <GetPage>[
    GetPage(
      name: splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: index,
      page: (() => const IndexPage()),
      binding: IndexBinding(),
    )
  ];
}
