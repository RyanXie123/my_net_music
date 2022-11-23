import 'package:my_net_music/http/request.dart';
import 'package:my_net_music/http/request_api.dart';
import 'package:my_net_music/typedef/function.dart';

class RequestRepository {
  sendCode({
    required String phone,
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.sendCode,
      params: {'phone': phone},
      success: (data) {
        print('data=====>$data');

        ///去看一下返回的数据类型
        if (data['code'] == 200) {
          if (success != null) {
            success(true);
          }
        } else {
          if (success != null) {
            success(false);
          }
        }
      },
    );
  }

  ///验证验证码
  ///[phone]手机号
  ///[captcha]验证码
  ///[success]成功回调
  ///[fail]失败回调
  verifyCode({
    required String phone,
    required String captcha,
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.verifyCode,
      params: {
        'phone': phone,
        'captcha': captcha,
      },
      success: (data) {
        ///去看一下返回的数据类型
        if (data['code'] == 200) {
          if (success != null) {
            success(true);
          }
        } else {
          if (success != null) {
            success(false);
          }
        }
      },
      fail: fail,
    );
  }

  ///邮箱登录
  ///[email]邮箱
  ///[password]密码
  ///[success]成功回调
  ///[fail]失败回调
  emailLogin({
    required String email,
    required String password,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      params: {
        'email': email,
        'password': password,
      },
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  ///手机登录
  ///[phone]手机号
  ///[password]密码
  ///[success]成功回调
  ///[fail]失败回调
  phoneLogin({
    required String phone,
    required String password,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.phoneLogin,
      params: {
        'phone': phone,
        'password': password,
      },
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  ///这三个接口返回的数据是一样的
  ///验证码登录
  ///[phone]手机号
  ///[captcha]验证码
  ///[success]成功回调
  ///[fail]失败回调
  captchaLogin({
    required String phone,
    required String captcha,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      params: {
        'phone': phone,
        'captcha': captcha,
      },
      success: (data) {
        ///如果正确会返回cookie
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail(data['msg']);
          }
        }
      },
      fail: fail,
    );
  }

  getPlaylist({
    String order = 'hot',
    String cat = '华语',
    int limit = 10,
    int offset = 0,
    Success? success,
    Fail? fail,
  }) {
    var params = {
      'order': order,
      'cat': cat,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };
    Request.get(
      RequestApi.playlist,
      params: params,
      success: success,
      fail: fail,
    );
  }
}
