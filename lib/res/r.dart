class R {
  static final images = _Images();
  static final fonts = _Fonts();
  static final videos = _Videos();
}

class _Images {
  static const path = 'assets/images/';
  final logo = '${path}logo.png';
  final appBackground = '${path}app_backgroun.png';
}

class _Fonts {
  final GuFengLiShu = 'GuFengLiShu';
  final PuHuiTi = 'PuHuiTi';
  final PuHuiTiX = 'PuHuiTiX';
}

class _Videos {
  static const path = 'assets/videos/';
  final loginVideo = '${path}login_video.mp4';
}
