// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import "package:flutter/material.dart";
import "package:states_rebuilder/states_rebuilder.dart";

import "../../../apps/prayersApp/core/widgets.dart";
import "../../apps.dart";
import "../../reactiveModels.dart";
import "../authentication.dart";

class LoginForm extends ReactiveStatelessWidget {
  LoginForm({key}) : super(key: key);
  final obscure = RM.inject(() => true);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return OnFormBuilder(
      listenTo: loginForm,
      builder: () {
        return Scaffold(
          body: Stack(
            children: [
              BackgroundWidget(size),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                            // TODO - ability to add user from login page if not found in repository, may be going to register page from here
                            // TODO - add ability to goto REGISTER page. when no users are added in repository.
                            // TODO - Sigup Support
                            controller: emailLoginForm.controller,
                            focusNode: emailLoginForm.focusNode,
                            decoration: InputDecoration(
                              labelText: "Type email",
                              errorText: emailLoginForm.error,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                            controller: passwordLoginForm.controller,
                            focusNode: passwordLoginForm.focusNode,
                            decoration: InputDecoration(
                              labelText: "Type password",
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(padding),
                                child: IconButton(
                                  onPressed: () => obscure.toggle(),
                                  icon: Icon(obscure.state ? Icons.visibility : Icons.visibility_off),
                                ),
                              ),
                              errorText: passwordLoginForm.error,
                            ),
                            obscureText: obscure.state,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => loginForm.submit(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: ElevatedButton(
                            onPressed: loginForm.isValid ? loginForm.submit : null,
                            child: Text("Login"),
                          ),
                        ),
                        Divider(),
                        for (final eachApp in Apps.values)
                          Card(
                            child: ListTile(
                              title: Text(
                                eachApp.description,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
