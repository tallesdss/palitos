import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CepCodastroCall {
  static Future<ApiCallResponse> call({
    int? cep,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cep Codastro',
      apiUrl: 'https://cep.awesomeapi.com.br/json/${cep}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? cep(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
  static String? quadranome(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.address_name''',
      ));
  static String? quadra(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  static String? cidadetipo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.address_type''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.district''',
      ));
  static String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.state''',
      ));
  static String? lat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lat''',
      ));
  static String? lng(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lng''',
      ));
  static String? cityibge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city_ibge''',
      ));
  static String? ddd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ddd''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
