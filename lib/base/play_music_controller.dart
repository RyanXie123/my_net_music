import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:my_net_music/base/base_get_controller.dart';
import 'package:my_net_music/models/play_entity.dart';

class PlayMusicController extends BaseGetController {
  late AudioPlayer _player;
  PlayerState playerState = PlayerState.PLAYING;

  /// 播放列表
  final songs = <PlayEntity>[].obs;

  /// 当前播放的歌曲索引
  final currentIndex = 0.obs;

  ///已播放时长
  Duration played = const Duration();

  ///进度条总长度
  Duration all = const Duration();

  ///是否正在拖动进度条
  bool _isSeeking = false;

  @override
  void onInit() {
    _player = AudioPlayer();
    super.onInit();

    ///播放状态监听已播放进度
    _player.onAudioPositionChanged.listen((event) {
      played = event;
      if (!_isSeeking) {
        update(['time']);
      }
    });

    ///播放状态监听总时长
    _player.onDurationChanged.listen((event) {
      all = event;
      if (!_isSeeking) {
        update(['time']);
      }
    });

    ///播放状态监听
    _player.onPlayerStateChanged.listen((event) {
      playerState = event;

      ///更新播放状态通知ui更新
      update(['animation']);
    });

    ///播放完成监听
    _player.onPlayerCompletion.listen((event) {
      ///播放完成
      // next();
    });
  }

  ///播放
  play() async {
    repository.getSongUrl(
      id: songs[currentIndex.value].id,
      success: (data) async {
        await _player.play(data);
      },
    );
  }
}
