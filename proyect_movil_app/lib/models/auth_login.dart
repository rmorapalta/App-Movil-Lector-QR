import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:snippet_coder_utils/hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class Auth {
  final String token;
  final String sign;
  final String redirectUrl;
  final String created;

  static var data;

  Auth(this.token, this.sign, this.redirectUrl, this.created);

  factory Auth.fromJson(Map<String, dynamic> data) {
    return Auth(
      data['token'],
      data['sign'],
      data['redirectUrl'],
      data['created'],
    );
  }
}

List<Auth> parseAuth(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Auth>((json) => Auth.fromJson(json)).toList();
}

Future<List<Auth>> fetchProducts() async {
  final response = await http.get(
      Uri.parse('https://api.sebastian.cl/classroom/v1/authentication/login'));
  if (response.statusCode == 200) {
    return parseAuth(response.body);
  } else {
    throw Exception('Las credenciales no son correctas, intente nuevamente.');
  }
}

final Uri _url = Uri.parse(Auth.data['redirectUrl']);

class _AuthPageState extends State<AuthPage> {
  @override
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fetchProducts();
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Utem.png",
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Center(
              child: Text(
                "Bienvenidos Estudiantes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white70,
                ),
              ),
            ),

          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                child: const Text(
                  'Ingresar con tu cuenta UTEM.',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  if(await canLaunchUrl(_url)){
                    await launchUrl(_url);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}





