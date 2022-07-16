import 'dart:html';

import 'package:http/http.dart' as http;

class User_services {
  static getUsers() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      print('success ${response.body}');
    } else {
      print('Error from getUsers in User_services \n ${response.statusCode}');
    }
  }
}
