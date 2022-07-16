import 'dart:convert';
import 'package:clothes_mvvm/model/user.dart';
import 'package:http/http.dart' as http;

class User_services {
  static Future<List<User>> getUsers() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> responseList = jsonDecode(response.body);
      List<User> UsersList = Response.fromJson(responseList).response;
      return UsersList;
    } else {
      print('Error from getUsers in User_services \n ${response.statusCode}');
      return [];
    }
  }
}
