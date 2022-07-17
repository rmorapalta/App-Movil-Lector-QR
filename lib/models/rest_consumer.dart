import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Student {
  final String classroom;
  final String subject;
  final String entrance;
  final String leaving;
  final String email;

  Student(
      this.classroom, this.subject, this.entrance, this.leaving, this.email);

  factory Student.fromJson(Map<String, dynamic> data) {
    return Student(
      data['classroom'],
      data['subject'],
      data['entrance'],
      data['leaving'],
      data['email'],
    );
  }

}

List<Student> parseStudent(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Student>((json) => Student.fromJson(json)).toList();
}

Future<List<Student>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://api.sebastian.cl/classroom/swagger-ui/index.html#/classroom-rest/attendances'));
  if (response.statusCode == 200) {
    return parseStudent(response.body);
  } else {
    throw Exception('No se leyó nada desde la REST API.');
  }
}
