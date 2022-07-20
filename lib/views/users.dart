import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/views/user.dart';
import 'package:clothes_mvvm/views_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users_details extends StatelessWidget {
  const Users_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel usersProvider = context.watch<UserViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Users Data'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(158, 0, 0, 255),
        ),
        body: userRow(usersProvider));
  }
}

Widget userRow(UserViewModel usersProvider) {
  List<User> UsersData = usersProvider.usersList;

  if (usersProvider.loading) {
    return const CircularProgressIndicator();
  } else {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            thickness: MediaQuery.of(context).size.width * .03,
          );
        },
        itemCount: UsersData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => userDetails(UsersData[index])));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //headline Name
                Text(
                  UsersData[index].name!,
                ),
                Text(
                    '${usersProvider.leftDetailsHeadLines[1]} ${UsersData[index].email!}')
              ],
            ),
          );
        });
  }
}
