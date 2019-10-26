import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:numbers_game/models/fact.dart';

String baseURL = "http://numbersapi.com/";

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
};

Future<Fact> getTriviaFact({String number = "random"}) async {
  final response = await http
      .get("$baseURL/${number.trim()}", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return Fact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Trivia fact",
        StackTrace.fromString("Unable to fetch Trivia fact"));
  }
}

Future<Fact> getYearFact({String year = "random"}) async {
  final response = await http
      .get("$baseURL/${year.trim()}/year", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return Fact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Year fact",
        StackTrace.fromString("Unable to fetch Year fact"));
  }
}

Future<Fact> getDateFact({String date = "random"}) async {
  final response = await http
      .get("$baseURL/${date.trim()}/date", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return Fact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Date fact",
        StackTrace.fromString("Unable to fetch Date fact"));
  }
}

Future<Fact> getMathFact({String number = "random"}) async {
  final response = await http
      .get("$baseURL/${number.trim()}/math", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return Fact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Math fact",
        StackTrace.fromString("Unable to fetch Math fact"));
  }
}
