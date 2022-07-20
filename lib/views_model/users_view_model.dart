import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/repo/usersApi.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  List<User> usersList = [];
  bool loading = false;

  UserViewModel() {
    getusers();
  }
  //start fetch data from api //
  void setLoading(bool trueOrFalse) async {
    loading = trueOrFalse;
    notifyListeners();
  }

  getusers() async {
    setLoading(true);
    usersList = await UserApi.getUsers();
    setLoading(false);
  }
//end fetch data from api //

}
