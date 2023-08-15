import 'dart:developer';

class ApiConstants {
  static const String baseUrl = "https://exercisedb.p.rapidapi.com/";
  static const String exercise = "exercises";


  static String getParamsFromBody(Map<String, dynamic>? body) {
    String params = '?';
    for (var i = 0; i < body!.keys.length; i++) {
      params += '${List.from(body.keys)[i]}=${List.from(body.values)[i]}';
      if (i != body.keys.length - 1) {
        params += '&';
      }
    }
    log(params);
    return params;
  }
}
