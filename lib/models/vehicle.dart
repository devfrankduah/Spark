import 'dart:convert';

List<Vehicle> vehicleFromJson(String str) => List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

String vehicleToJson(List<Vehicle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vehicle {
  Vehicle({
    required this.id,
    required this.name,
    required this.year,
    required this.image1,
    required this.image2,
  });

  final int id;
  final String name;
  final String year;
  final String image1;
  final String image2;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    image1: json["selfie"],
    image2: json["id_card"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "selfie": image1,
    "id_card": image2,
  };
}
