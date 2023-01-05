// ignore_for_file: prefer_const_constructors, file_names

import "package:dashboard/apps/idealApp/controllers/core.dart";
import "package:flutter/material.dart";
import "package:states_rebuilder/states_rebuilder.dart";

import "../reactiveModels.dart";

class UserInformations extends ReactiveStatelessWidget {
  const UserInformations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("ACCOUNT SETTINGS"),
        subtitle: currentUser != null
            ? Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("NAME: ${currentUser!.name.toString()}"),
                          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_outlined))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.memory(
                            defaultImage,
                          ),
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.update,
                      //   ),
                      // ),

                      Text("EMAIL: ${currentUser!.email}", softWrap: true),
                      Text(
                        "PHONE: ${currentUser!.age.toString()}",
                        softWrap: true,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: ElevatedButton(
                      onPressed: signout,
                      child: Text(
                        "SIGN OUT",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).errorColor),
                      onPressed: () async {},
                      child: Text(
                        "DELETE ACCOUNT permanently",
                      ),
                    ),
                  ),
                ],
              )
            : Text("no user is signed in"),
      ),
    );
  }
}
