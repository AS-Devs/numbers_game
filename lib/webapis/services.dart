import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:numbers_game/models/fact.dart';

String baseURL = "http://numbersapi.com/";

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
};

Future<Fact> getRandomFact() async {
  final response = await http
      .get("$baseURL/random", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return Fact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch random fact",
        StackTrace.fromString("Unable to fetch random fact"));
  }
}
