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

  ///获取歌单
  static const String playlist = '/top/playlist';
}
