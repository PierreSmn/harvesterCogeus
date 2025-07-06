import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetSupaCall {
  static Future<ApiCallResponse> call({
    String? slug = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get supa',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/live_flows?slug=eq.${slug}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? brand(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].brand_name''',
      ));
  static String? gift(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gift_name''',
      ));
  static String? expla(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].expla2''',
      ));
  static String? end(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].end_message''',
      ));
  static String? imageURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gift_image_link''',
      ));
  static String? slug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].slug''',
      ));
  static String? logoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].logoUrl''',
      ));
  static String? colorBG(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].colorBG''',
      ));
  static String? colorButton(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].colorButton''',
      ));
  static String? colorTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].colorTitle''',
      ));
  static String? colorText(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].colorText''',
      ));
  static String? colorButtonText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].colorButtonText''',
      ));
  static String? codePromo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].codePromo''',
      ));
  static String? descriptionCodePromo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].descriptionCodePromo''',
      ));
  static String? ctaUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].ctaUrl''',
      ));
  static int? cameraSelect(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].cameraSelect''',
      ));
  static bool? twogifts(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].twogifts''',
      ));
  static bool? carouselBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].carousel_bool''',
      ));
  static String? carouselCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].carousel_code''',
      ));
  static bool? mailOnlyBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].mail_only_bool''',
      ));
  static bool? isrugby(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].is_rugby''',
      ));
}

class PostSubmissionFgCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? surname = '',
    String? email = '',
    String? video = '',
    String? slug = '',
    String? brand = '',
    String? time = '',
    bool? boolmail = false,
    String? question = '',
    String? nomClub = '',
    String? instagram = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "surname": "${surname}",
  "email": "${email}",
  "video": "${video}",
  "slug": "${slug}",
  "brand": "${brand}",
  "time": "${time}",
  "boolmail": ${boolmail},
  "question": "${question}",
  "nomClub": "${nomClub}",
  "instagram": "${instagram}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post submission fg',
      apiUrl: 'https://qmtvmp.buildship.run/submitff',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RecontactRequestCall {
  static Future<ApiCallResponse> call({
    int? notifId,
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? message = '',
    int? recontactId,
  }) async {
    final ffApiRequestBody = '''
{
  "notif_id": ${notifId},
  "recontact_id": ${recontactId},
  "email": "${email}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}",
  "message": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Recontact request',
      apiUrl: 'https://tryinit.fastgenapp.com/recontact',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NewStartCall {
  static Future<ApiCallResponse> call({
    String? slug = '',
    String? brand = '',
    String? time = '',
  }) async {
    final ffApiRequestBody = '''
{
  "slug": "${slug}",
  "brand": "${brand}",
  "time": "${time}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'New start',
      apiUrl: 'https://tryinit.fastgenapp.com/flowstart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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
