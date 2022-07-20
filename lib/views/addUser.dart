import 'package:clothes_mvvm/model/user.dart';
import 'package:clothes_mvvm/views_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views_model/Add_User_view_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();

  TextEditingController phoneCont = TextEditingController();
  TextEditingController websiteCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: ChangeNotifierProvider(
                create: (_) => AddUserProvider(),
                builder: (context, child) {
                  AddUserProvider addUserProv = Provider.of(context);
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //name
                        formField(
                            nameCont, TextInputType.name, 'Name', context),
                        //email
                        formField(emailCont, TextInputType.emailAddress,
                            'Email', context),
                        //phone
                        formField(
                          phoneCont,
                          TextInputType.number,
                          'Phone',
                          context,
                        ),
                        //website
                        formField(
                          websiteCont,
                          TextInputType.name,
                          'Website',
                          context,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                User newUser = User(
                                    id: DateTime.now().millisecond,
                                    name: nameCont.text,
                                    username: '',
                                    email: emailCont.text,
                                    address: Address(
                                        street: '',
                                        suite: '',
                                        city: '',
                                        zipcode: '',
                                        geo: Geo(lat: '', lng: '')),
                                    phone: phoneCont.text,
                                    website: websiteCont.text,
                                    company: Company(
                                        bs: '', catchPhrase: '', name: ''));

                                addUserProv.AddnewUser(newUser);
                              },
                              child: const Text('Add'),
                            )),
                        addUserProv.testflag != 0
                            ? const Text(
                                'please fill all the required informations')
                            : Container()
                      ]);
                }),
          ),
        ),
      ),
    );
  }
}

Widget formField(TextEditingController cont, TextInputType inputType,
    String label, BuildContext context) {
  return Column(
    children: [
      TextFormField(
        controller: cont,
        keyboardType: inputType,
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .03,
      ),
    ],
  );
}
