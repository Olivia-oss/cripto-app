import 'dart:convert';

List<Coin> coinFromJson(List<dynamic> data) =>
    List<Coin>.from(data.map((e) => Coin.fromJson(e)));

String coinToJson(Coin data) => json.encode(data.toJson());

class Coin {
  String symbol;
  int priority;
  int id;
  String logo;
  String name;

  Coin({
    required this.symbol,
    required this.priority,
    required this.id,
    required this.logo,
    required this.name,
  });

  Coin copyWith({
    String? symbol,
    int? priority,
    int? id,
    String? logo,
    String? name,
  }) =>
      Coin(
        symbol: symbol ?? this.symbol,
        priority: priority ?? this.priority,
        id: id ?? this.id,
        logo: logo ?? this.logo,
        name: name ?? this.name,
      );

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        symbol: json["symbol"],
        priority: json["priority"],
        id: json["id"],
        logo: json["logo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "priority": priority,
        "id": id,
        "logo": logo,
        "name": name,
      };
}
