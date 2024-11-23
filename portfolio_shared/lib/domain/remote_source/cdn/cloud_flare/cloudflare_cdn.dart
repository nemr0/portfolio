import 'dart:io';

import 'package:dio/dio.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/exceptions/network_exception.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';
import 'package:portfolio_shared/domain/remote_source/cdn/cdn_abs.dart';
class CloudflareCDN extends CDN {
  static final CloudflareCDN _instance = CloudflareCDN._internal();

  factory CloudflareCDN() {
    return _instance;
  }

  CloudflareCDN._internal() {
    _init();
  }

  late Dio dio;

  void _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://storage.nemr.dev',
        headers: _accountIdHeader,
      ),
    );
  }

  ExceptionImpl _mapExceptionFromDio(DioException e, StackTrace s) {
    if (e.error is SocketException) {
      return NetworkException(
          endpoint: 'list',
          stackTrace: s,
          error: e.toString(),
          message: 'No Internet Connection, Please Try Again!');
    }

    return ServerException(
        endpoint: 'list',
        stackTrace: s,
        error: e.toString(),
        message: 'Something went wrong, Please Try Again!');
  }

  @override
  Future<List<String>?> getAllImages() async {
    try {
      final response = await dio.get('list');
      return List<String>.from(response.data);
    } on DioException catch (e, s) {
      throw _mapExceptionFromDio(e, s);
    }
  }

  @override
  Future<int> getPhotoCountForProject(String projectName) async {
    try {
      final response = await dio.get('photo-count/$projectName');
      return response.data['photo-count'] ?? 0;
    } on DioException catch (e, s) {
      throw _mapExceptionFromDio(e, s);
    }
  }
  static const  _accountIdHeader ={
    "account-id": String.fromEnvironment('CLOUDFLARE_ACCOUNT_ID'),
  };
  @override
  String getPhotoUrl(String path) {
    final formattedPath = path.startsWith('/') ? path : '/$path';
    final accountId = dio.options.headers['account-id'];

    // Append the account-id as a query parameter
    final url = '${dio.options.baseUrl.replaceFirst(RegExp(r'/$'), '')}$formattedPath';
    return '$url?account-id=$accountId';
  }
}