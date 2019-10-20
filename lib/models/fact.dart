class Fact {
  final String text;
  final bool found;
  final double number;
  final String type;
  final String date;
  final String year;

  Fact(this.text, this.found, this.number, this.type,
      {this.date = "", this.year = ""});

  factory Fact.fromJson(Map<String, dynamic> json) =>
      new Fact(json["text"], json["found"], json["number"], json["type"]);

  Map<String, dynamic> toJson() => {
        'text': text,
        'found': found,
        'number': number,
        'type': type,
        'date': date,
        'year': year
      };
}
