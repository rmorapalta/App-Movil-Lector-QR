import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_movil_app/pages/code_qr.dart';
import 'package:proyect_movil_app/pages/home.dart';
import 'package:proyect_movil_app/pages/login.dart';
import 'package:proyect_movil_app/pages/register.dart';
import 'package:proyect_movil_app/pages/home.dart';
import 'package:proyect_movil_app/pages/developers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyect_movil_app/provider/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'gg',
        theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
        home: const LoginPage(),
      )
  );

  /*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Movil Asistencia Estudiantes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => const LoginPage(),
        '/register': (context) => const RegisterPage()},


);
  }*/
}
