/*
DioManager：Dio辅助类
NWMethod：请求方法，get、post等
NWApi：大家都知道
EntityFactory：json转换辅助工厂，把json转为T
BaseEntity<T>：数据基类，返回的参数为 {“code”: 0, “message”: “”, “data”: {}}
BaseListEntity<T>：数据基类2，返回的参数为 {“code”: 0, “message”: “”, “data”: []}
ErrorEntity：请求报错基类，{“code”: 0, “message”: “”}
*/

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:widget_demo/dio/api.dart';
import 'package:widget_demo/dio/error_entity.dart';
import 'package:widget_demo/dio/method.dart';
import 'package:widget_demo/search/search_model.dart';

/*网络请求的复杂封装*/ //参考文献：https://juejin.im/post/6844903708757590024#heading-9
class DioManager {
  static final DioManager _shared = DioManager._internal();
  factory DioManager() => _shared;
  Dio dio;
  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: Api.baseApi,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: 20000,
        receiveTimeout: 5000,
      );
      dio = Dio(options);

      //Cookie管理
      dio.interceptors.add(CookieManager(CookieJar()));

      // 添加拦截器
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print("请求之前");
        // Do something before request is sent
        return options; //continue
      }, onResponse: (Response response) {
        print("响应之前");
        // Do something with response data
        return response; // continue
      }, onError: (DioError e) {
        print("错误之前");
        // Do something with response error
        return e; //continue
      }));
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(Method method, String path,
      {Map params, Function(T) success, Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: MethodValues[method]));
      if (response != null) {
        // response.data 即为请求下来的所有内容
        // 注意：如果接口最外层有共同的参数，可以在这里包一层  BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        // 具体参考 链接： https://juejin.im/post/6844903708757590024#heading-9
        success(response.data);
      } else {
        print("未知fsefsf--------");
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      print("未知错误f-------");
      error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(Method method, String path,
      {Map params, Function(List) success, Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: MethodValues[method]));
      if (response != null) {
        success(response.data);
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            String errMsg = error.response.statusMessage;
            return ErrorEntity(code: errCode, message: errMsg);
//          switch (errCode) {
//            case 400: {
//              return ErrorEntity(code: errCode, message: "请求语法错误");
//            }
//            break;
//            case 403: {
//              return ErrorEntity(code: errCode, message: "服务器拒绝执行");
//            }
//            break;
//            case 404: {
//              return ErrorEntity(code: errCode, message: "无法连接服务器");
//            }
//            break;
//            case 405: {
//              return ErrorEntity(code: errCode, message: "请求方法被禁止");
//            }
//            break;
//            case 500: {
//              return ErrorEntity(code: errCode, message: "服务器内部错误");
//            }
//            break;
//            case 502: {
//              return ErrorEntity(code: errCode, message: "无效的请求");
//            }
//            break;
//            case 503: {
//              return ErrorEntity(code: errCode, message: "服务器挂了");
//            }
//            break;
//            case 505: {
//              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
//            }
//            break;
//            default: {
//              return ErrorEntity(code: errCode, message: "未知错误");
//            }
//          }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}
