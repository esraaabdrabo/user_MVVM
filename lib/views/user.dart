import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/views/users.dart';
import 'package:flutter/material.dart';

class userDetails extends StatelessWidget {
  User userData;
  userDetails(this.userData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(userData.username!),
          centerTitle: true,
          backgroundColor: Color.fromARGB(158, 0, 0, 255),
        ),
        body: userDetialesRow(context, userData));
  }
}

Widget userDetialesRow(BuildContext context, User userData) {
  List<String> title = ['Email : ', 'Phone : ', 'WebSite : '];
  List<String> data = [userData.email!, userData.phone!, userData.website!];

  return Container(
    //leave space around
    margin: EdgeInsets.all(
      MediaQuery.of(context).size.width * .1,
    ),
    //.1 left +.1 right + .8 width
    width: MediaQuery.of(context).size.width * .8,
    height: MediaQuery.of(context).size.height * .2,
    //to make gradient border
    //give gradient back ground to parent
    //then white bg to child and padding
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(158, 0, 0, 255),
      Color.fromARGB(202, 238, 255, 0),
    ])),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Text(userData.name!),
            Divider(
              thickness: MediaQuery.of(context).size.height * .002,
            ),
            //headline and data

            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(title[index]), Text(data[index])],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}
