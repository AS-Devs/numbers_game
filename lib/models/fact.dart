import 'dart:math';

class NumberFact {
  final String text;
  final bool found;
  final String number;
  final String type;
  final String date;
  final String year;

  NumberFact(this.text, this.found, this.number, this.type,
      {this.date = "", this.year = ""});

  factory NumberFact.fromJson(Map<String, dynamic> json) => new NumberFact(
      json["text"], json["found"], json["number"].toString(), json["type"],
      date: json["date"].toString(), year: json["year"].toString());

  Map<String, dynamic> toJson() => {
        'text': text,
        'found': found,
        'number': number,
        'type': type,
        'date': date,
        'year': year
      };
}

class GeneralFact {
  final String id;
  final String text;

  GeneralFact(this.id, this.text);

  factory GeneralFact.fromJson1(Map<String, dynamic> json) =>
      new GeneralFact(json["id"], json["text"]);

  factory GeneralFact.fromJson2(Map<String, dynamic> json) =>
      new GeneralFact(Random().toString(), json["data"]);
}

class CatFact {
  final String id;
  final String text;

  CatFact(this.id, this.text);

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      new CatFact(Random().toString(), json["fact"]);
}

class QuoteFact {
  String id;
  String quoteText;
  String quoteAuthor;

  QuoteFact(this.id, this.quoteText, this.quoteAuthor);

  QuoteFact.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    quoteText = json['quoteText'];
    quoteAuthor = json['quoteAuthor'];
  }
}
