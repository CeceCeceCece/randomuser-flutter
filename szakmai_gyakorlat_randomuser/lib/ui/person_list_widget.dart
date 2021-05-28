import 'package:flutter/material.dart';
import 'package:szakmai_gyakorlat_randomuser/model/list_person.dart';
import 'package:szakmai_gyakorlat_randomuser/model/person_detail.dart';
import 'package:szakmai_gyakorlat_randomuser/model/person_item.dart';
import 'package:szakmai_gyakorlat_randomuser/network/RandomUserRepository.dart';

import 'details_widget.dart';
import 'list_item_widget.dart';

class PersonListWidget extends StatefulWidget {
  PersonListWidget({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonListWidget> {
  late Future<PersonList> peopleListRequest;
  late bool isLargeScreen;
  final repository = ListRepository();
  final fetchedPeople = <PersonDetails>[];
  final ScrollController _scrollController = ScrollController();
  int _pageCount = 1;
  PersonDetails? viewedPerson;

  @override
  void initState() {
    peopleListRequest = repository.getUsers(_pageCount);
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        addNewElements();
      }
    });
  }

  Future<void> refreshList() async {
    _pageCount = 1;
    fetchedPeople.clear();
    var request = repository.getUsers(_pageCount);
    setState(() {
      peopleListRequest = request;
    });
    await request;
  }

  Future<void> addNewElements() async {
    _pageCount++;
    var request = repository.getUsers(_pageCount);
    setState(() {
      peopleListRequest = request;
    });
    await request;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          title: Text('Randomusers'),
        ),*/
        body: OrientationBuilder(builder: (context, orientation) {
      isLargeScreen = MediaQuery.of(context).size.width > 600 ? true : false;

      return Row(
        children: [
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Randomusers'),
              ),
              body: RefreshIndicator(
                onRefresh: refreshList,
                child: FutureBuilder<PersonList>(
                    future: peopleListRequest,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        fetchedPeople.addAll(snapshot.data!.people);
                        snapshot.data!.people = List.empty();

                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          itemBuilder: (context, i) {
                            return ListItem(fetchedPeople[i].itemPerson,
                                onTap: () {
                              if (!isLargeScreen) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PersonDetailsWidget(
                                        person: fetchedPeople[i],
                                        isLandscapeMode: isLargeScreen)));
                              } else {
                                setState(() {
                                  viewedPerson = fetchedPeople[i];
                                });
                              }
                            });
                          },
                          itemCount: fetchedPeople.length,
                        );
                      } else if (snapshot.hasError) {
                        return Align(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.wifi_off_rounded, size: 100),
                                SizedBox(height: 30),
                                Text("Something went wrong...",
                                    style: const TextStyle(fontSize: 20)),
                                SizedBox(height: 10),
                                Text("Please check your internet connection",
                                    style: const TextStyle(fontSize: 15)),
                                SizedBox(height: 50),
                                ElevatedButton(
                                  onPressed: refreshList,
                                  child: Text("Try again"),
                                )
                              ]),
                        );
                      }
                      return Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    }),
              ),
            ),
          ),
          isLargeScreen
              ? Expanded(
                  child: PersonDetailsWidget(
                  person: viewedPerson,
                  isLandscapeMode: isLargeScreen,
                ))
              : Container(),
        ],
      );
    }));
  }
}
