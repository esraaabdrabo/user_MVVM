import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/views/addUser.dart';
import 'package:clothes_mvvm/views/user.dart';
import 'package:clothes_mvvm/views_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersDetails extends StatelessWidget {
  const UsersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel usersProvider = context.watch<UserViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users Data'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(158, 0, 0, 255),
        ),
        body: usersProvider.loading
            // ignore: prefer_const_constructors
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [userRow(usersProvider), addBtn(context)],
              ));
  }
}

Widget userRow(UserViewModel usersProvider) {
  List<User> userData = usersProvider.usersList;

  return Expanded(
    child: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .005,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(158, 0, 0, 255),
              Color.fromARGB(202, 238, 255, 0),
            ])),
          );
        },
        itemCount: userData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => userDetails(userData[index])));
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  //headline Name
                  Text(
                    userData[index].name!,
                  ),
                  Text('Email : ${userData[index].email!}')
                ],
              ),
            ),
          );
        }),
  );
}

Widget addBtn(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: const Text('Add'),
      ),
    ]),
  );
}
