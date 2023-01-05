// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_print, avoid_unnecessary_containers

import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:states_rebuilder/states_rebuilder.dart";

import "../../reactiveModels.dart";
import "../../../apps/prayersApp/core/widgets.dart";
import "../authentication.dart";

class RegisterForm extends ReactiveStatelessWidget {
  RegisterForm({key}) : super(key: key);
  final obscure = RM.inject(() => true);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register - enter your details"),
      ),
      body: Stack(
        children: [
          BackgroundWidget(size),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: OnFormBuilder(
                listenTo: registerForm,
                builder: () {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        // shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: TextFormField(
                              controller: nameFF.controller,
                              focusNode: nameFF.focusNode,
                              decoration: InputDecoration(
                                labelText: "Type name",
                                errorText: nameFF.error,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: TextFormField(
                              controller: emailRegisterForm.controller,
                              focusNode: emailRegisterForm.focusNode,
                              decoration: InputDecoration(
                                labelText: "Type email",
                                errorText: emailRegisterForm.error,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: TextFormField(
                              controller: passwordRegisterForm.controller,
                              focusNode: passwordRegisterForm.focusNode,
                              decoration: InputDecoration(
                                labelText: "Type password",
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(padding),
                                  child: IconButton(
                                    onPressed: () => obscure.toggle(),
                                    icon: Icon(obscure.state ? Icons.visibility : Icons.visibility_off),
                                  ),
                                ),
                                errorText: passwordRegisterForm.error,
                              ),
                              obscureText: obscure.state,
                            ),
                          ),
                          OnFormFieldBuilder(
                            listenTo: dateOfBirthFF,
                            builder: (_, __) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () async {
                                    var cache = dateOfBirthFF.value;
                                    var temp = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                    );
                                    if (temp != null) {
                                      dateOfBirthFF.value = temp;
                                    } else {
                                      dateOfBirthFF.value = cache;
                                    }
                                  },
                                  child: Text(DateFormat("d-M-y").format(_)),
                                ),
                              );
                            },
                          ),
                          OnFormFieldBuilder(
                            listenTo: dateOfPubertyFF,
                            builder: (_, __) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () async {
                                    var cache = dateOfPubertyFF.value;
                                    var temp = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                    );
                                    if (temp != null) {
                                      dateOfPubertyFF.value = temp;
                                    } else {
                                      dateOfPubertyFF.value = cache;
                                    }
                                  },
                                  child: Text(DateFormat("d-M-y").format(_)),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: ListTile(
                              title: Text("Your age is"),
                              subtitle: Text(
                                "${DateTime.now().difference(dateOfBirthFF.value).inDays ~/ 365} years",
                                textScaleFactor: 1.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: ElevatedButton.icon(
                              onPressed: registerForm.isValid ? registerForm.submit : null,
                              icon: Icon(Icons.people),
                              label: Text("Register"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
