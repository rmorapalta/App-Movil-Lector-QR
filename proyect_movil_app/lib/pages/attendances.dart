import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart'show AppBar, BuildContext, Card, Center, Key, ListTile, ListView, MaterialApp, MaterialPageRoute, Navigator, Scaffold, SizedBox, State, StatefulWidget, Text, Widget, Widgett;
import 'package:http/http.dart' show get;


import '../main.dart';

class AttendancesPage extends StatefulWidget {
  const AttendancesPage({Key? key}) : super(key: key);

  @override
  State<AttendancesPage> createState() => _AttendancesPageState();
}

class _AttendancesPageState extends State<AttendancesPage> {
  final url = "https://api.sebastian.cl/classroom/v1/classroom/attendances";

  var _postJson = [];

  void fetchAttendance() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {}
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Asistencia ☺")),
        ),
        body: ListView.builder(
          itemCount: _postJson.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Center(child: SizedBox(child: Text(_postJson[index]['Sala']))),
                subtitle: Text(_postJson[index]['subject']),
                trailing: Text(_postJson[index]['entrance']),
                leading: Text(_postJson[index]['leaving']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AttendancesPage()),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

