import 'package:http/http.dart' as http;

postData()async{
  var response = http.post(Uri.parse("https://api.sebastian.cl/classroom/swagger-ui/index.html#/classroom-rest/getIn"), body: {
    "classroom":,
    "subject":,
    "entrance":
  }
  );
}