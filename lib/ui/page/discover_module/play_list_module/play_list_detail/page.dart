import 'package:flutter/material.dart';

import 'package:my_net_music/base/views/get_state_view.dart';
import 'package:my_net_music/models/play_list_detail_entity.dart';
import 'package:my_net_music/models/play_list_detail_song_entity.dart';
import 'package:my_net_music/models/play_list_entity.dart';
import 'package:my_net_music/ui/page/discover_module/play_list_module/play_list_detail/controller.dart';

class PlayListDetailPage
    extends GetStateView<PlayListDetailController, Map<String, dynamic>> {
  const PlayListDetailPage({super.key});

  @override
  Widget build(BuildContext context, Map<String, dynamic> data) {
    var entity = data['entity'] as PlayListDetailEntity;
    var songs = data['songs'] as List<PlayListDetailSongEntity>;
    var related = data['related'] as List<PlayListEntity>;

    return Container();
  }
}
