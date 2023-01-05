import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../core/reactiveModels.dart';

class BackgroundWidget extends ReactiveStatelessWidget {
  final Size size;

  const BackgroundWidget(this.size, {super.key});
  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height / 4 - 56,
            color: color.shade200,
          ),
          Container(
            width: size.width,
            height: size.height * 3 / 4 - 36,
            color: color.shade700,
          )
        ],
      ),
    );
  }
}
