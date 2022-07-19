import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/repo/usersApi.dart';
import 'package:clothes_mvvm/views/users.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  List<User> usersList = [];
  bool loading = false;
  void setLoading(bool trueOrFalse) async {
    loading = trueOrFalse;
    notifyListeners();
  }

  UserViewModel() {
    getusers();
  }
  getusers() async {
    setLoading(true);
    usersList = await UserApi.getUsers();
    setLoading(false);
  }
}
