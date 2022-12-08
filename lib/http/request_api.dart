class RequestApi {
  static const String BASE_URL = "http://localhost:3000/";

  ///邮箱登录
  static const String login = '/login';

  ///手机登录
  static const String phoneLogin = '/login/cellphone';

  ///发送验证码
  static const String sendCode = '/captcha/sent';

  ///刷新登录
  static const String refreshLogin = '/login/refresh';

  ///验证验证码
  static const String verifyCode = '/captcha/verify';

  // 轮播图

  static const String banner = '/banner?type=1';

  ///获取歌单
  static const String playlist = '/top/playlist';
}
