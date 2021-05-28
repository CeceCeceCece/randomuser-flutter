import 'person_detail.dart';

class PersonList {
  List<PersonDetails> people;

  PersonList({required this.people});

  factory PersonList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<PersonDetails> peopleList =
        list.map((i) => PersonDetails.fromJson(i)).toList();
    return PersonList(people: peopleList);
  }
}
