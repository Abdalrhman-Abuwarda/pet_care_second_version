import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../utils/enums.dart';
import '../../../utils/helper.dart';
import '../../local_data/storage_service.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(

      RequestOptions options, RequestInterceptorHandler handler) async {
    //
    options.headers['Authorization'] = "Bearer ${sl<StorageService>().accessToken}";
    super.onRequest(options, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        {
          showErrorSnackBar("Check your internet connection");
          // debugPrint('This is connectTimeout [The exception for a failed connection attempt.] $err');
          // debugPrint(err.response!.statusCode.toString());
          throw Exception("No Internet Connection");
        }
      case DioExceptionType.receiveTimeout:
        {
          debugPrint(
              "This is receiveTimeout error [The exception for failing to receive a response.] $err");
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioExceptionType.sendTimeout:
        {
          debugPrint(
              "This is sendTimeout error [The exception for failing to send a request.] $err");
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioExceptionType.cancel:
        {
          debugPrint(
              'This is cancel error [The exception for a prematurely cancelled request.] $err');
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioExceptionType.badResponse:
        {
          handleResponseError(err);
        }
        break;
      case DioExceptionType.unknown:
        {
          debugPrint('This is other Type error $err');
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.connectionError:
        showErrorSnackBar("No internet connection");
        // TODO: Handle this case.
        break;
    }
    super.onError(err, handler);
  }

  void showErrorSnackBar(String message) {
    Helpers.showSnackBar(message: message);
  }

  void handleResponseError(DioException err) {
    final response = err.response;
    if (response != null) {
      final statusCode = response.statusCode;
      final message = response.data["message"];
      showSnackBarAndDebugPrint(message);
      switch (statusCode) {
        case 400:
          {
            // showSnackBarAndDebugPrint(responseData);
          }
          break;
        case 404:
          {
            // showSnackBarAndDebugPrint(responseData);
          }
          break;
        case 401:
          {
            // showSnackBarAndDebugPrint(responseData);
            // locator<AuthRepo>().refreshTokenRepo(token: SharedPrefController().accessToken);
          }
          break;
        case 422:
          {
            debugPrint("This is error message \n ${response.data.toString()}");
            // showSnackBarAndDebugPrint(response.data?["message"] ?? "Error");
          }
          break;
        default:
          {
            // showSnackBarAndDebugPrint(responseData);
          }
          break;
      }
      debugPrint(statusCode.toString());
      debugPrint(message);
    }
  }

  void showSnackBarAndDebugPrint(String message) {
    // Helpers.showSnackBar(message: message);
    Helpers.showDialog(message: message , status: LoadingStatusOption.error);
    debugPrint(message);
  }
}
