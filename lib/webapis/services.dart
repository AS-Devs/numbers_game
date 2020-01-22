import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:numbers_game/models/fact.dart';

String baseURLNumberFacts = "http://numbersapi.com/";
String baseUrlGeneralFacts1 = "https://uselessfacts.jsph.pl/random.json?language=en";
String baseUrlGeneralFacts2 = "https://useless-facts.sameerkumar.website/api";
String baseUrlCatFacts = "https://catfact.ninja/fact?max_length=1000";
String baseUrlQuoteFacts = "https://quote-garden.herokuapp.com/quotes/random";

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
};

Future<NumberFact> getTriviaFact({String number = "random"}) async {
  final response = await http
      .get("$baseURLNumberFacts/${number.trim()}", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return NumberFact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Trivia fact",
        StackTrace.fromString("Unable to fetch Trivia fact"));
  }
}

Future<NumberFact> getYearFact({String year = "random"}) async {
  final response = await http
      .get("$baseURLNumberFacts/${year.trim()}/year", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return NumberFact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Year fact",
        StackTrace.fromString("Unable to fetch Year fact"));
  }
}

Future<NumberFact> getDateFact({String date = "random"}) async {
  final response = await http
      .get("$baseURLNumberFacts/${date.trim()}/date", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return NumberFact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Date fact",
        StackTrace.fromString("Unable to fetch Date fact"));
  }
}

Future<NumberFact> getMathFact({String number = "random"}) async {
  final response = await http
      .get("$baseURLNumberFacts/${number.trim()}/math", headers: requestHeaders)
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return NumberFact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Math fact",
        StackTrace.fromString("Unable to fetch Math fact"));
  }
}

Future<GeneralFact> getGeneralFact() async {
  final random = Random().nextBool();
  final response = random
      ? await http.get(baseUrlGeneralFacts1).timeout(Duration(seconds: 10))
      : await http.get(baseUrlGeneralFacts2).timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    if (random) {
      return GeneralFact.fromJson1(factMap);
    } else {
      return GeneralFact.fromJson2(factMap);
    }
  } else {
    return Future.error("Unable to fetch General fact",
        StackTrace.fromString("Unable to fetch General fact"));
  }
}

Future<CatFact> getCatFact() async {
  final response =
      await http.get(baseUrlCatFacts).timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return CatFact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Cat fact",
        StackTrace.fromString("Unable to fetch Cat fact"));
  }
}

Future<QuoteFact> getQuoteFact() async {
  final response =
      await http.get(baseUrlQuoteFacts).timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    Map factMap = jsonDecode(response.body);
    return QuoteFact.fromJson(factMap);
  } else {
    return Future.error("Unable to fetch Quote fact",
        StackTrace.fromString("Unable to fetch Quote fact"));
  }
}
