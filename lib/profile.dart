import 'dart:convert';

List<Profile> profileFromJson(String str) =>
    List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  Profile({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.cell,
  });

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  String cell;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        cell: json["cell"] == null ? null : json["cell"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "cell": cell == null ? null : cell,
      };
  // getAddress() {
  //   print(address);
  //   return address;
  // }
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.cell,
    this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  String cell;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        cell: json["cell"] == null ? null : json["cell"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "cell": cell == null ? null : cell,
        "geo": geo.toJson(),
      };
  getAddress() {
    return '$suite $street $city $zipcode';
  }
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
