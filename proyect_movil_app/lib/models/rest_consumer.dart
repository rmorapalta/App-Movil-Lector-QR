import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Student {
  String classroom;
  String subject;
  DateTime entrance;
  DateTime leaving;
  String email;

  Student({
    required this.classroom,
    required this.subject,
    required this.entrance,
    required this.leaving,
    required this.email,
  });



  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      classroom: json['classroom'],
      subject: json['subject'],
      entrance: DateTime.parse(json['entrance']),
      leaving: DateTime.parse(json['leaving']),
      email: json['email'],
    );
  }

  static Future<Object> fetchAsistencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString('jwt');

    return Dio(
      BaseOptions(
        baseUrl: "https://api.sebastian.cl/classroom/v1/classroom",
        headers: {
          'Accept': 'application/json',
          'jwt': jwt,
        },
      ),
    );
  }
}