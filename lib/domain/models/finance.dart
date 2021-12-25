// @HiveType(typeId: 1)
class Finance {
  int? id;
  String nominal;
  String desc;
  String date;
  String month;
  String year;
  late String fullDate;

  Finance(
      {this.id,
      required this.desc,
      required this.date,
      required this.nominal,
      required this.month,
      required this.year}) {
    fullDate = "$date-$month-$year";
  }

  factory Finance.fromJson(Map<String, dynamic> json) => Finance(
      id: json["id"],
      nominal: json["nominal"],
      desc: json["desc"],
      date: json["date"],
      month: json["month"],
      year: json["year"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nominal": nominal,
        "desc": desc,
        "date": date,
        "month": month,
        "year": year,
      };
}
