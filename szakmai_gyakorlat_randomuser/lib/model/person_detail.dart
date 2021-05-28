import 'package:szakmai_gyakorlat_randomuser/model/person_item.dart';

class PersonDetails {
  final ItemPerson itemPerson;
  final Location location;
  final Contacts contacts;
  final String gender;

  PersonDetails(
      {required this.itemPerson,
      required this.location,
      required this.contacts,
      required this.gender});
  @override
  String toString() {
    return "${itemPerson.name}, ${contacts.cellNumber}";
  }

  factory PersonDetails.fromJson(Map<String, dynamic> json) {
    return PersonDetails(
        itemPerson: ItemPerson(
            name: Name.fromJson(json['name']),
            imageUrls: ImageUrls.fromJson(json['picture'])),
        location: Location.fromJson(json['location']),
        contacts: Contacts(email: json['email'], cellNumber: json['cell']),
        gender: json['gender']);
  }
}

class Location {
  final String city;
  final String country;
  final String state;

  Location({required this.city, required this.country, required this.state});

  @override
  String toString() {
    return "$city, $state, $country";
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        city: json['city'], country: json['country'], state: json['state']);
  }
}

class Contacts {
  final String email;
  final String cellNumber;

  Contacts({required this.email, required this.cellNumber});

  String toString() {
    return "Email: $email, Cellphone: $cellNumber";
  }

  factory Contacts.fromJson(Map<String, dynamic> json) {
    return Contacts(email: json['email'], cellNumber: json['cell']);
  }
}
