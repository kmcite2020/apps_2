// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class FeedbackTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('FEEDBACK'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('other features will be added. soon'),
        ],
      ),
    );
  }
}
