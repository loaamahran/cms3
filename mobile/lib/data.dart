import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getCourses() async {
  var meals = await http
      .get(Uri.parse('http://100.100.100.58:5003/api/v1/courses/student'));
  if (meals.statusCode == 200) {
    var data = jsonDecode(meals.body);
    print(data);
    return data;
  } else {
    throw Exception("Failed to load data ${meals.statusCode}");
  }
}

Future<void> gemostafatUser({String? email, String? password}) async {
  var user = await http.post(
      Uri.parse('http://100.100.100.58:5003/api/v1/:entity/login'),
      body: jsonEncode({'email': email ?? "", 'password': password ?? ""}));
  if (user.statusCode == 200) {
    print(user.body);
    // var data = jsonDecode(user.body);
    // print(data);
    // return data;
  } else {
    throw Exception("Failed to load data ${user.statusCode}");
  }
}
