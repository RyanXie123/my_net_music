import 'package:my_net_music/http/request.dart';
import 'package:my_net_music/http/request_api.dart';
import 'package:my_net_music/typedef/function.dart';

class RequestRepository {
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
