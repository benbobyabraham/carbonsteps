import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nttgreen/utils/constants.dart';

String username = '';
String token = '';
String email = '';

Future userAuth(String email, String password) async {
  Map body = {"email": email, "password": password};
  var url = Uri.parse("$baseURL/user/signin/");
  var res = await http.post(url, body: body);
  print(res.body);

  print(res.statusCode);
  if (res.statusCode == 201) {
    Map json = jsonDecode(res.body);
    username = json['username'];
    token = json['token'];
    email = json['email'];

    Constants.userName = username;
    Constants.email = email;
    Constants.authToken = token;
    return token;
  } else {
    return null;
  }
}

//call this to get the list element . use below code to  get data according to index
//  var loginUserData = getUserData();
// String username = loginUserData[0];
// List<String> getUserData() {
//   return [username, email, token];
// }

Future registration(String username, String email, String password,
    String phone, String gender, String dob) async {
  final url = Uri.parse("$baseURL/user/signup/");

  final Map<String, dynamic> data = {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "gender": gender,
    "dob": dob
  };

  final response = await http.post(url, body: data);
  print(response.body);

  print(response.statusCode);
  if (response.statusCode == 201) {
    Map json = jsonDecode(response.body);
    String token = json['token'];
    // final Token = token;
    return token;
  } else {
    return null;
  }
}
