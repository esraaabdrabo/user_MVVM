import 'dart:convert';
import 'package:clothes_mvvm/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> getUsers() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> responseList = jsonDecode(response.body);
      List<User> usersList = Response.fromJson(responseList).response;
      return usersList;
    } else {
      // print('Error from getUsers in UserApi \n ${response.statusCode}');
      return [];
    }
  }
}
