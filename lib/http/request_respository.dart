import 'package:my_net_music/http/request.dart';
import 'package:my_net_music/http/request_api.dart';
import 'package:my_net_music/models/new_song_entity.dart';
import 'package:my_net_music/models/play_list_entity.dart';
import 'package:my_net_music/models/recom_play_entity.dart';
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

  refreshLogin({Success<String>? success, Fail? fail}) {
    Request.get<Map<String, dynamic>>(RequestApi.refreshLogin, dialog: false,
        success: (data) {
      if (data['code'] == 200) {
        success!(data['cookie']);
      } else {
        if (fail != null) {
          fail('');
        }
      }
    }, fail: fail);
  }

  banner({Success<List<String>>? success, Fail? fail}) {
    Request.get<Map<String, dynamic>>(
      RequestApi.banner,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <String>[];
          data['banners'].forEach((element) {
            result.add(element['pic']);
          });
          if (success != null) {
            success(result);
          }
        } else {}
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

  getNewSongs({required Success<List<NewSongEntity>> success, Fail? fail}) {
    Request.get<Map<String, dynamic>>(
      RequestApi.newSong,
      dialog: false,
      success: ((data) {
        if (data['code'] == 200) {
          var result = <NewSongEntity>[];
          data['result'].forEach((element) {
            result.add(
              NewSongEntity.fromJson(element),
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取推荐新音乐失败');
          }
        }
      }),
      fail: fail,
    );
  }

  ///获取歌单分类列表
  ///[success]成功回调
  ///[fail]失败回调
  getPlayListCatList({
    required Success<List<String>> success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlistCatlist,
      dialog: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <String>[];
          data['tags'].forEach((element) {
            result.add(
              element['name'],
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取歌单分类列表失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单列表
  ///[cat]歌单分类
  ///[success]成功回调
  ///[fail]失败回调
  ///[limit]每页数量
  ///[offset]偏移量
  ///[order]排序方式order: 可选值为 'new' 和 'hot', 分别对应最新和最热 , 默认为 'hot'
  getPlayList({
    required String cat,
    required int offset,
    int limit = 21,
    required Success<List<PlayListEntity>> success,
    String order = 'hot',
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlist,
      dialog: false,
      params: {
        'cat': cat,
        'limit': limit,
        'offset': '${offset * limit}',
        'order': order,
      },
      success: (data) {
        if (data['code'] == 200) {
          var result = <PlayListEntity>[];
          data['playlists'].forEach((element) {
            result.add(
              PlayListEntity.fromJson(element),
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取歌单列表失败');
          }
        }
      },
      fail: fail,
    );
  }

  getRecomPlays({
    Success<List<RecomPlayListEntity>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.recomPlays,
      dialog: false,
      success: ((data) {
        if (data['code'] == 200) {
          var result = <RecomPlayListEntity>[];
          data['recommend'].forEach((element) {
            result.add(RecomPlayListEntity.fromJson(element));
          });
          if (success != null) {
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取推荐歌单失败');
          }
        }
      }),
      fail: fail,
    );
  }
}
