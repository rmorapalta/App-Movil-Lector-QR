import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Auth {
  final String token;
  final String sign;
  final String redirectUrl;
  final String created;

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
  final response = await http.get(Uri.parse(
      'https://api.sebastian.cl/classroom/swagger-ui/index.html#/authentication-rest/login'));
  if (response.statusCode == 200) {
    return parseAuth(response.body);
  } else {
    throw Exception('Las credenciales no son correctas, intente nuevamente.');
  }
}
