// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:states_rebuilder/states_rebuilder.dart';

class OpthalomologyMCQsApp extends ReactiveStatelessWidget {
  const OpthalomologyMCQsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ophthalmology MCQs",
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text("CHAPTERS", textScaleFactor: 3),
                Text("total questions 345"),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text("ORBIT"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text("RETINA"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text("SCLERA"),
            ),
          ),
        ],
      ),
    );
  }
}
