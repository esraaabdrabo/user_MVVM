import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/views_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users_details extends StatelessWidget {
  const Users_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel usersProvider = context.watch<UserViewModel>();
    return userRow(usersProvider);
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
          return Column(
            children: [
              //headline Name
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  UsersData[index].name!,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left details
                  Container(
                    width: MediaQuery.of(context).size.width * .4,
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                            '${usersProvider.leftDetailsHeadLines[0]} ${UsersData[index].username!}'),
                        Text(
                            '${usersProvider.leftDetailsHeadLines[1]} ${UsersData[index].email!}'),
                        Text(
                            '${usersProvider.leftDetailsHeadLines[2]} ${UsersData[index].phone!}'),
                        Text(
                            '${usersProvider.leftDetailsHeadLines[3]}${UsersData[index].website!}'),
                      ],
                    ),
                  ),

                  //right details
                  Column(
                    children: [
                      Text(UsersData[index].company!.name),
                      Text('Address'),
                      Text(UsersData[index].address!.city!),
                      Text(UsersData[index].address!.street!),
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}
