import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:my_net_music/http/http_exception.dart';
import 'package:my_net_music/http/request_api.dart';
import 'package:my_net_music/typedef/function.dart';
import 'package:my_net_music/utils/toast_util.dart';

const int connectTimeout = 10000;
const int receiveTimeout = 10000;
const int sendTimeout = 10000;

class HttpRequest {
  static Dio? _dio;
  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      var opt = BaseOptions(
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        validateStatus: (status) => true,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        connectTimeout: connectTimeout,
        baseUrl: RequestApi.BASE_URL,
      );
      _dio = Dio(opt);
    }
    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  static Future request<T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    bool isJson = false,
    Success? success,
    Fail? fail,
  }) async {
    try {
      var connectResult = await Connectivity().checkConnectivity();
      if (connectResult == ConnectivityResult.none) {
        ToastUtil.show("网络连接失败，请检查网络");
        return;
      }
      Dio dio = createInstance(isJson);
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }

      Response resp = await dio.request(
        path,
        data: data,
        queryParameters: params,
        options: Options(
          method: _methodValues[method],
        ),
      );
      if (success != null) {
        success(resp.data);
      }
    } on DioError catch (e) {
      String msg = HttpException.handleException(e);
      if (fail != null) {
        fail(msg);
      }
    }
  }
}

enum Method {
  GET,
  POST,
}

const _methodValues = {
  Method.GET: 'get',
  Method.POST: 'post',
};
