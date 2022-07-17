import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/repo/usersApi.dart';
import 'package:clothes_mvvm/views_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class users extends StatefulWidget {
  const users({Key? key}) : super(key: key);

  @override
  State<users> createState() => _usersState();
}

class _usersState extends State<users> {
  // late Future<List<User>> UsersData;

  @override
  void initState() {
    super.initState();
    //  UsersData = UserApi.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel usersProvider = Provider.of(context);
    usersProvider.getusers();
    return Text(usersProvider.usersList[0].name!);
    /* FutureBuilder<List<User>>(
        future: UsersData,
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Text(snapshot.data![0].name!,
                  style: const TextStyle(
                    color: Color.fromARGB(188, 0, 0, 255),
                  ));
            } else {
              return Container();
            }
          }
          return Container();
        });
  */
  }
}
