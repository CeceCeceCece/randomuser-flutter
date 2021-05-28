import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:szakmai_gyakorlat_randomuser/model/list_person.dart';

PersonList _parseRandomusers(String json) {
  return PersonList.fromJson(jsonDecode(json));
}

class RandomUserService {
  Future<PersonList> fetchPeopleList(int page) async {
    var queryParams = {
      'results': '12',
      'inc': 'gender,name,nat,picture,email,cell,phone,location',
      'seed': 'whatever',
      'page': page.toString()
    };
    var uri = Uri.https('www.randomuser.me', '/api/', queryParams);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return await compute(_parseRandomusers, response.body);
    } else {
      throw Exception('Failed to load people');
    }
  }
}
