import 'package:szakmai_gyakorlat_randomuser/model/list_person.dart';
import 'package:szakmai_gyakorlat_randomuser/network/randomuser_service.dart';

class ListRepository {
  var ruService = RandomUserService();

  Future<PersonList> getUsers(int _page) async {
    return await ruService.fetchPeopleList(_page);
  }
}