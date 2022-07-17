import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/repo/usersApi.dart';
import 'package:clothes_mvvm/views/users.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  List<User> usersList = [];
  Future<void> getusers() async {
    usersList = await UserApi.getUsers();
    notifyListeners();
  }
}
