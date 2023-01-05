// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_import, unused_local_variable, no_leading_underscores_for_local_identifiers, must_be_immutable

import 'dart:math';

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../core/reactiveModels.dart';
import 'dashboard.dart';

class Settings extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Settings"),
        actions: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: IconButton(
              tooltip: 'Back to Dashboard',
              onPressed: () => RM.navigate.back(),
              icon: Icon(
                Icons.dashboard,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            ...themingWidgets(size),
          ],
        ),
      ),
    );
  }
}
