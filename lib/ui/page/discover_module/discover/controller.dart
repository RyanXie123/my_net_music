import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_net_music/base/base_get_controller.dart';
import 'package:my_net_music/res/r.dart';
import 'package:my_net_music/utils/date_util.dart';

class DiscoverController extends BaseGetController with StateMixin {
  final banners = <String>[];

  final buttons = <Map<String, dynamic>>[
    {
      'src': R.images.iconFm,
      'title': '私人FM',
      'onTap': () {},
      'day': null,
    },
    {
      'src': R.images.iconDaily,
      'title': '每日推荐',
      'onTap': () {},
      'day': DateUtil.getToday(),
    },
    {
      'src': R.images.iconPlaylist,
      'title': '歌单广场',
      'onTap': () {},
      'day': null,
    },
    {
      'src': R.images.iconRank,
      'title': '排行榜',
      'onTap': () {},
      'day': null,
    },
  ];
  @override
  void onInit() {
    super.onInit();

    getData();
  }

  getData() {
    respository.banner(success: ((data) {
      banners.addAll(data);
      update();
      change(null, status: RxStatus.success());
    }));
  }
}
