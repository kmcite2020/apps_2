// ignore_for_file: prefer_const_constructors, await_only_futures, prefer_const_literals_to_create_immutables, file_names

import 'package:dashboard/core/authentication/authentication.dart';
import 'package:dashboard/core/apps.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../core/reactiveModels.dart';

class UserManagerApp extends ReactiveStatelessWidget {
  const UserManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Accounts'),
        actions: [AppSelectorToggle()],
      ),
      body: ListView(
        children: [
          for (final eachUser in users)
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  ListTile(
                    onTap: () => RM.navigate.to(UserDetails(userModel: eachUser)),
                    leading: CircleAvatar(
                      child: Text('${eachUser.age.inDays ~/ 365}'),
                    ),
                    title: Center(
                      child: Text(
                        eachUser.email,
                        textScaleFactor: .75,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          eachUser.password,
                          textScaleFactor: .75,
                        ),
                        // Text("${eachUser.farzPrayers.inDays * 5}"),
                        // Text(
                        //   eachUser.name.toString(),
                        // ),
                        // Text(DateFormat('d-M-y').format(eachUser.dateOfBirth)),
                        // Text(
                        //   DateFormat('d-M-y').format(
                        //     eachUser.dateOfPuberty ?? DateTime.now(),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            heroTag: Uuid().v1(),
            tooltip: 'DELETE ALL USERS',
            onPressed: () {
              users = <UserModel>[]; // CLEAR ALL USERS FROM REPOSITORIES
            },
            child: Icon(Icons.delete),
          ),
          FloatingActionButton(
            heroTag: Uuid().v1(),
            tooltip: 'ADD USER DATA',
            onPressed: () {
              users = [
                ...users,
                UserModel(
                  email: Uuid().v1(),
                  password: Uuid().v4(),
                  dateOfBirth: DateTime.now(),
                )
              ]; // CLEAR ALL USERS FROM REPOSITORIES
            },
            child: Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UserDetails extends ReactiveStatelessWidget {
  UserDetails({required this.userModel, super.key});
  final UserModel userModel;
  final visible = false.inj();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name.toString()),
      ),
      body: Card(
        child: Center(
          child: Column(
            children: [
              Text(userModel.email),
              Text(userModel.password),
              Text(userModel.dateOfBirth.toIso8601String()),
              Text(userModel.dateOfPuberty.toString()),
              Text(userModel.farzPrayers.toString()),
              Text(
                userModel.age.toString(),
              ),
              Column(
                children: [
                  visible.state
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                onFieldSubmitted: (value) {
                                  userModel.copyWith(name: value);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: visible.toggle,
                                child: Text(
                                  'HIDE',
                                ),
                              ),
                            )
                          ],
                        )
                      : ElevatedButton(
                          onPressed: visible.toggle,
                          child: Text(
                            'EDIT NAME',
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
