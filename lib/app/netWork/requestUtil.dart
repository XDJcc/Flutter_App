import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';

class DioRequest {
  late Dio _dio;

  Dio get dio => _dio;

  ///缓存配置
  late CacheOptions? cacheOptions;

  ///Cookie 配置
  CookieJar? cookieJar;

  ///构造方法
  ///如果baseUrl不等于空，options中的baseUrl属性会被这个参数覆盖
  DioRequest(
      {String? baseUrl,
        BaseOptions? op,
        LogInterceptor? log,
        CacheOptions? cache,
        String? cookiePath,
        Transformer? transformer,
        List<Interceptor>? interceptorList}) {
    _dio = Dio(op);
    if (baseUrl != null && baseUrl.isNotEmpty) {
      _dio.options.baseUrl = baseUrl;
    }
    if (transformer != null) {
      _dio.transformer = transformer;
    }
    if (cache != null) {
      cacheOptions = cache;
      _dio.interceptors.add(DioCacheInterceptor(options: cache));
    }
    if (cookiePath != null && cookiePath.isNotEmpty) {
      cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
      _dio.interceptors.add(CookieManager(cookieJar!));
    }
    if (interceptorList != null && interceptorList.isNotEmpty) {
      _dio.interceptors.addAll(interceptorList);
    }
    if (kDebugMode && log != null) {
      _dio.interceptors.add(log);
    }
  }

  ///创建默认的DioRequest实例
  factory DioRequest.defaultInstance(
      {String? baseUrl,
        BaseOptions? op,
        String? cookiePath,
        Transformer? transformer,
        List<Interceptor>? interceptorList}) {
    final options = op ??
        BaseOptions(
            baseUrl: baseUrl ?? '',
            connectTimeout: 50000,
            sendTimeout: 50000,
            receiveTimeout: 50000,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json);

    final logInterceptor =
    LogInterceptor(responseHeader: false, requestBody: true);

    final cacheOptions = CacheOptions(
        store: MemCacheStore(),
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 7));

    return DioRequest(
        baseUrl: baseUrl,
        op: options,
        log: logInterceptor,
        cache: cacheOptions,
        cookiePath: cookiePath,
        transformer: transformer,
        interceptorList: interceptorList);
  }

  ///判断指定key的缓存是否存在
  Future<bool> cacheExists(String key) async {
    return await cacheOptions?.store?.exists(key) ?? false;
  }

  ///获取指定Key的缓存
  Future<CacheResponse?> getCache(String key) async {
    return await cacheOptions?.store?.get(key);
  }

  ///设置缓存
  Future<void> setCache(CacheResponse response) async {
    await cacheOptions?.store?.set(response);
  }

  ///删除缓存
  Future<void> deleteCache(String key, {bool staleOnly = false}) async {
    await cacheOptions?.store?.delete(key, staleOnly: staleOnly);
  }

  ///清除所有key的缓存
  Future<void> cleanCache(
      {CachePriority priorityOrBelow = CachePriority.high,
        bool staleOnly = false}) async {
    await cacheOptions?.store
        ?.clean(priorityOrBelow: priorityOrBelow, staleOnly: staleOnly);
  }

  ///释放底层资源
  Future<void> closeCache() async {
    await cacheOptions?.store?.close();
  }

  ///保存指定 uri 的 cookie。
  Future<void> saveFromResponse(Uri uri, List<Cookie> cookies) async {
    await cookieJar?.saveFromResponse(uri, cookies);
  }

  ///获取指定 uri 的 cookie。
  Future<List<Cookie>?> loadForRequest(Uri uri) async {
    return await cookieJar?.loadForRequest(uri);
  }

  ///删除所以cookie
  Future deleteAllCookie() async {
    await cookieJar?.deleteAll();
  }

  ///删除指定Uri的Cookie
  Future<void> deleteCookie(Uri uri,
      [bool withDomainSharedCookie = false]) async {
    await cookieJar?.delete(uri, withDomainSharedCookie);
  }
}
