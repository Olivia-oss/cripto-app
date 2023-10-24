class VenueDetails {
  final double lat;
  final String? postcode;
  final String? email;
  final double lon;
  final String? state;
  final String? phone;
  final String? category;
  final String? country;
  final dynamic logo;
  final String? name;
  final String? website;
  final dynamic logoUrl;
  final dynamic facebook;
  final String? description;
  final int id;
  final String? street;
  final dynamic twitter;
  final dynamic houseno;
  final dynamic instagram;
  final String? city;
  List<dynamic>? coins;

  VenueDetails({
    required this.lat,
    required this.postcode,
    required this.email,
    required this.lon,
    required this.state,
    required this.phone,
    required this.category,
    required this.country,
    required this.logo,
    required this.name,
    required this.website,
    required this.logoUrl,
    required this.facebook,
    required this.description,
    required this.id,
    required this.street,
    required this.twitter,
    required this.houseno,
    required this.instagram,
    required this.city,
    required this.coins,
  });

  factory VenueDetails.fromJson(Map<String, dynamic> json) => VenueDetails(
        lat: json["lat"]?.toDouble(),
        postcode: json["postcode"],
        email: json["email"],
        lon: json["lon"]?.toDouble(),
        state: json["state"],
        phone: json["phone"],
        category: json["category"],
        country: json["country"],
        logo: json["logo"],
        name: json["name"],
        website: json["website"],
        logoUrl: json["logo_url"],
        facebook: json["facebook"],
        description: json["description"],
        id: json["id"],
        street: json["street"],
        twitter: json["twitter"],
        houseno: json["houseno"],
        instagram: json["instagram"],
        city: json["city"],
        coins: List<dynamic>.from(json["coins"].map((x) => x)),
      );
}

class User {
  final String userhash;

  User({
    required this.userhash,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userhash: json["userhash"],
      );

  Map<String, dynamic> toJson() => {
        "userhash": userhash,
      };
}
