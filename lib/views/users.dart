import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/views_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users_details extends StatelessWidget {
  const Users_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<User> UsersData;

    UserViewModel usersProvider = context.watch<UserViewModel>();
    // usersProvider.getusers();

    return test(usersProvider);
  }
}

Widget test(UserViewModel usersProvider) {
  if (usersProvider.loading) {
    return const CircularProgressIndicator();
  } else {
    print(usersProvider.usersList.length);
    return Text(usersProvider.usersList[0].name!);
  }
}
