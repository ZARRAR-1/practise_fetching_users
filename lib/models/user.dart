class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  //Factory method to parse JSON data:
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );
  }
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  //Factory method to parse JSON data:
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
  });

// Added fromJson() method for API parsing:
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'],
    );
  }
} //end class user
