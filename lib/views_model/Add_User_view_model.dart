import 'package:clothes_mvvm/model/user.dart';
import 'package:flutter/cupertino.dart';

class AddUserProvider extends ChangeNotifier {
  late User newUser;
  int testflag = 0;

//strat adding new user//
  AddnewUser(User newUser) {
    testflag = 0;
    isValid(newUser.name!);
    isValid(newUser.phone!);
    isValid(newUser.website!);
    isValid(newUser.email!);
    this.newUser = newUser;
    print(testflag);
  }

  void isValid(String inputData) {
    if (inputData.isEmpty) {
      testflag++;
      notifyListeners();
    }
  }
}
