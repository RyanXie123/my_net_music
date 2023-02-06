import 'package:get/get.dart';
import 'package:my_net_music/base/controller/get_state_controller.dart';
import 'package:my_net_music/base/controller/play_music_controller.dart';

import 'package:my_net_music/models/play_list_detail_song_entity.dart';
import 'package:my_net_music/typedef/function.dart';

class PlayListDetailController
    extends GetStateController<Map<String, dynamic>> {
  int id = Get.arguments;

  ///是否为官方歌单
  bool isOfficial = false;

  ///歌曲列表
  List<PlayListDetailSongEntity> songs = [];

  final controller = Get.find<PlayMusicController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void request(ParamCallback<Map<String, dynamic>> success, Fail? fail) {}
}
