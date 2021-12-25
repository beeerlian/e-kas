// @HiveType(typeId: 1)
class Finance {
  int? id;
  String nominal;
  String desc;
  String date;

  Finance({
    this.id,
    required this.desc,
    required this.date,
    required this.nominal,
  });

  factory Finance.fromJson(Map<String, dynamic> json) => Finance(
      id: json["id"],
      nominal: json["nominal"],
      desc: json["desc"],
      date: json["date"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "nominal": nominal, "desc": desc, "date": date};
}


// @HiveType(typeId: 1)
// class Finance {
//   @HiveField(0)
//   String nominal;

//   @HiveField(1)
//   String desc;

//   @HiveField(2)
//   String date;

//   @HiveField(3)
//   bool isIncome;

//   Finance(
//       {required this.desc,
//       required this.date,
//       required this.nominal,
//       required this.isIncome});
// }
