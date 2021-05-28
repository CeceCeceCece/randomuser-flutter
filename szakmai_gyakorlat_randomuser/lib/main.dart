import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:szakmai_gyakorlat_randomuser/ui/person_list_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
            primarySwatch: Colors.blue, platform: TargetPlatform.android),
        home: PersonListWidget());
  }
}
