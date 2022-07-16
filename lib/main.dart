import 'package:flutter/material.dart';
import 'package:proyect_movil_app/pages/home.dart';
import 'package:proyect_movil_app/pages/login.dart';
import 'package:proyect_movil_app/pages/register.dart';
import 'package:proyect_movil_app/pages/home.dart';
import 'package:proyect_movil_app/pages/developers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Movil Asistencia Estudiantes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => const DevPage(),
        '/register': (context) => const RegisterPage()},





);
  }
}
