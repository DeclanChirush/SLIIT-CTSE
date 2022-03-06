import 'dart:convert';

import 'package:http/http.dart';

class AgifyService {
  static const String endPoint = "https://api.agify.io";

  const AgifyService();

  Future<int?> getAgeForName(String name) async {
    Response response = await get(Uri.parse(endPoint).replace(queryParameters: {
      "name": name,
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['age'];
    }
    throw Exception("Error is getting the age!");
  }
}
