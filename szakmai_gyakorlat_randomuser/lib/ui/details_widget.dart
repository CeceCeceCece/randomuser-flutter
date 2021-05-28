import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/person_detail.dart';

class PersonDetailsWidget extends StatelessWidget {
  final PersonDetails? person;
  final bool isLandscapeMode;
  late final List<MaterialAccentColor> colors;
  PersonDetailsWidget({this.person, required this.isLandscapeMode}) {
    this.colors = person?.gender == 'male'
        ? [Colors.blueAccent, Colors.lightBlueAccent]
        : [Colors.redAccent, Colors.deepOrangeAccent];
  }

  @override
  Widget build(BuildContext context) {
    if (person == null)
      return Scaffold(
          //appBar: AppBar(title: Text("Details:")),
          body: Align(
              alignment: Alignment.center,
              child: Text("Tap on someone to see some details!")));

    if (!isLandscapeMode) {
      //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      var radius = 60.0;
      return Scaffold(
        body: Column(children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: colors)),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      CachedNetworkImage(
                        imageUrl: person!.itemPerson.imageUrls.large,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: NetworkImage(
                            person!.itemPerson.imageUrls.large,
                          ),
                          backgroundColor: colors.first,
                          radius: radius,
                        ),
                        placeholder: (context, url) => new Center(
                            child: SizedBox(
                                width: radius * 2,
                                height: radius * 2,
                                child: CircularProgressIndicator(
                                  color: colors[1],
                                  strokeWidth: 5,
                                ))),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        person!.itemPerson.name.toString(),
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 18.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "City",
                                      style: TextStyle(
                                        color: colors.first,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      person!.location.city,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: colors[1],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Cell",
                                      style: TextStyle(
                                        color: colors.first,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      person!.contacts.cellNumber,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: colors[1],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 18.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Gender",
                                      style: TextStyle(
                                        color: colors.first,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      person!.gender,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: colors[1],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Zodiac sign",
                                      style: TextStyle(
                                        color: colors.first,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Capricorn",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: colors[1],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 18.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "E-mail",
                                      style: TextStyle(
                                        color: colors.first,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      person!.contacts.email,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: colors[1],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 18.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                        color: colors.first,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "${person!.location.state}, ${person!.location.country}",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: colors[1],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Get in touch!",
                          style: TextStyle(color: colors[1]),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: colors[1],
                            )),
                      ),
                    ],
                  ),
                ),
              )),
        ]),
      );
    } else {
      var radius = 65.0;
      return Scaffold(
        body: Column(children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: colors)),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: person!.itemPerson.imageUrls.large,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      person!.itemPerson.imageUrls.large,
                                    ),
                                    backgroundColor: colors.first,
                                    radius: radius,
                                  ),
                                  placeholder: (context, url) => new Center(
                                      child: SizedBox(
                                          width: radius * 2,
                                          height: radius * 2,
                                          child: CircularProgressIndicator(
                                            color: colors[1],
                                            strokeWidth: 5,
                                          ))),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.wifi_off_rounded,
                                          size: radius),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  person!.itemPerson.name.toString(),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              flex: 5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home_work_rounded,
                                            color: Colors.white),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${person!.location.city},",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "${person!.location.country}",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                            (person!.gender == "male")
                                                ? Icons.male_rounded
                                                : Icons.female_rounded,
                                            color: Colors.white),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          person!.gender,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ]))
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 3.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              //Expanded(
                              /*child: */ Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Icon(Icons.email, color: colors[0]),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    person!.contacts.email,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: colors[1],
                                    ),
                                  )
                                ],
                              ),
                              //),
                              //Expanded(
                              /*child:*/
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Icon(Icons.phone, color: colors[0]),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    person!.contacts.cellNumber,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: colors[1],
                                    ),
                                  )
                                ],
                              ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Get in touch!",
                          style: TextStyle(color: colors[1]),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: colors[1],
                            )),
                      )

                    ],
                  ),
                ),
              )),
        ]),
      );
    }
  }
}
