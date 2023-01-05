// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, unused_local_variable, prefer_const_constructors
import "dart:convert";

import "package:equatable/equatable.dart";
import "package:flutter/cupertino.dart";
import "package:states_rebuilder/states_rebuilder.dart";

import "../reactiveModels.dart";

final loginForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    for (final eachUser in users) {
      if (eachUser.email == emailLoginForm.value) {
        print("${emailLoginForm.value} Match found");
        if (eachUser.password == passwordLoginForm.value) {
          print("password matched");
          currentUser = eachUser;
          return;
        } else {
          print("password did not match");
          return;
        }
      } else {
        print("waiting...");
      }
    }
    print("no match found");
  },
);
final registerForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    UserModel tempUSER = UserModel(
      name: nameFF.value,
      email: emailRegisterForm.value,
      password: passwordRegisterForm.value,
      dateOfBirth: dateOfBirthFF.value,
      dateOfPuberty: dateOfPubertyFF.value,
    );
    users = [...users, tempUSER];
    currentUser = tempUSER;
    RM.navigate.back();
  },
);

final usersRM = RM.inject<List<UserModel>>(
  () => <UserModel>[],
  persist: () => PersistState(
    key: "users",
    toJson: (s) => UserModel.toListJson(s),
    fromJson: (json) => UserModel.fromListJson(json),
  ),
);
List<UserModel> get users => usersRM.state;
set users(value) => usersRM.state = value;

final emailLoginForm = RM.injectTextEditing(
  validators: [
    (text) {
      for (final eachUser in users) {
        if (text == eachUser.email) {
          return null;
        }
      }
      return "user not available in repository";
    }
  ],
);
final emailRegisterForm = RM.injectTextEditing(
  validators: [
    (text) {
      for (final eachUser in users) {
        if (text == eachUser.email) {
          return "user already exists";
        }
      }
      return null;
    }
  ],
);
final passwordLoginForm = RM.injectTextEditing(
  validators: [
    (text) {
      if (text!.isEmpty) {
        return "passwords can not be empty";
      }
      return null;
    }
  ],
);
final passwordRegisterForm = RM.injectTextEditing(
  validators: [
    (text) {
      if (text!.isEmpty) {
        return "passwords can not be empty";
      }
      return null;
    }
  ],
);
final nameFF = RM.injectTextEditing(validators: []);
final dateOfBirthFF = RM.injectFormField(
  DateTime.now(),
  validators: [
    (date) {
      if (DateTime.now().difference(date).inDays < 13 * 365) {
        return "Your age is ${DateTime.now().difference(date).inDays ~/ 365} years.";
      }
      return null;
    }
  ],
);
final dateOfPubertyFF = RM.injectFormField(DateTime.now());

class UserModel extends Equatable {
  Duration get age => DateTime.now().difference(dateOfBirth);
  Duration get farzPrayers {
    if (dateOfPuberty != null) {
      return DateTime.now().difference(dateOfPuberty!);
    } else {
      if (age.inDays > 13 * 365) {
        return DateTime.now().difference(dateOfBirth.add(Duration(days: 13 * 365)));
      }
    }

    return Duration();
  }

  final String email;
  final String? name;
  final String password;
  final DateTime dateOfBirth;
  final DateTime? dateOfPuberty;
  const UserModel({
    required this.email,
    this.name,
    required this.password,
    required this.dateOfBirth,
    this.dateOfPuberty,
  });

  static List<UserModel> fromListJson(String source) {
    final List result = json.decode(source) as List;
    return result.map((e) => UserModel.fromJson(e)).toList();
  }

  static String toListJson(List<UserModel> users) {
    final List result = users.map((e) => e.toJson()).toList();
    return json.encode(result);
  }

  UserModel copyWith({
    String? email,
    String? name,
    String? password,
    DateTime? dateOfBirth,
    DateTime? dateOfPuberty,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      dateOfPuberty: dateOfPuberty ?? this.dateOfPuberty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "email": email,
      "name": name,
      "password": password,
      "dateOfBirth": dateOfBirth.millisecondsSinceEpoch,
      "dateOfPuberty": dateOfPuberty?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map["email"] as String,
      name: map["name"] != null ? map["name"] as String : null,
      password: map["password"] as String,
      dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map["dateOfBirth"] as int),
      dateOfPuberty: map["dateOfPuberty"] != null ? DateTime.fromMillisecondsSinceEpoch(map["dateOfPuberty"] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      email,
      // name,
      password,
      dateOfBirth,
      // dateOfPuberty,
    ];
  }
}
