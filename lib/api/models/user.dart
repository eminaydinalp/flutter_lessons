class User{
  final int id;
  final String name;
  final String email;
  //final String city;
  final Address address;

  User({required this.email, required this.name, required this.id, required this.address});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      //city: json['address'] != null ? json['address']['city'] ?? '' : ''
      address: Address.fromJson(json['address'] ?? {})
    );
  }
}

class Address{
  final String city;

  Address({required this.city});

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
        city: json['city'] ?? ''
    );
  }

}