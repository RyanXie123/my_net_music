class RequestApi {
  static const String BASE_URL = "http://xieru.asuscomm.com:4000/";

  ///邮箱登录
  static const String login = '/login';

  ///手机登录
  static const String phoneLogin = '/login/cellphone';

  ///发送验证码
  static const String sendCode = '/captcha/sent';

  ///验证验证码
  static const String verifyCode = '/captcha/verify';

  ///刷新登录
  static const String refreshLogin = '/login/refresh';

  ///轮播图
  static const String banner = '/banner?type=1';

  ///获取推荐歌单
  static const String recomPlays = '/recommend/resource';

  ///获取推荐新音乐
  static const String newSong = '/personalized/newsong';

  ///获取歌单分类
  static const String playlistCatlist = '/playlist/hot';

  ///获取歌单列表
  static const String playlist = '/top/playlist';
}
