class Restaurant {
  String id;
  String title;
  String time;
  String imageUrl;
  List<dynamic> foods;
  bool pickup;
  bool deliver;
  String owner;
  bool isAvailable;
  String code;
  String logoUrl;
  int rating;
  String ratingCount;
  Coords coords;
  DateTime createdAt;
  DateTime updatedAt;

  Restaurant({
    required this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.foods,
    required this.pickup,
    required this.deliver,
    required this.owner,
    required this.isAvailable,
    required this.code,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.coords,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
        pickup: json["pickup"],
        deliver: json["deliver"],
        owner: json["owner"],
        isAvailable: json["isAvailable"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        coords: Coords.fromJson(json["coords"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "foods": List<dynamic>.from(foods.map((x) => x)),
        "pickup": pickup,
        "deliver": deliver,
        "owner": owner,
        "isAvailable": isAvailable,
        "code": code,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "coords": coords.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Coords {
  String id;
  int lattitude;
  int longitude;
  String address;
  String title;
  double lattitudeDelta;

  Coords({
    required this.id,
    required this.lattitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.lattitudeDelta,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
        address: json["address"],
        title: json["title"],
        lattitudeDelta: json["lattitudeDelta"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lattitude": lattitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "lattitudeDelta": lattitudeDelta,
      };
}
