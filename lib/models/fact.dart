class Fact {
  final String text;
  final bool found;
  final String number;
  final String type;
  final String date;
  final String year;

  Fact(this.text, this.found, this.number, this.type,
      {this.date = "", this.year = ""});

  factory Fact.fromJson(Map<String, dynamic> json) => new Fact(
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
