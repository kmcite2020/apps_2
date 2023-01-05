// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:states_rebuilder/states_rebuilder.dart';
import '../../../core/reactiveModels.dart';
import '../beseechApp.dart';
import '../core.dart';

class DeleteAll extends ReactiveStatelessWidget {
  const DeleteAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: const Text('DELETE ALL'),
        subtitle: const Text('deletes all data and completely restores to default settings'),
        onLongPress: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(
              const MaterialBanner(
                content: DeleteBanner(),
                actions: [SizedBox()],
              ),
            );
        },
      ),
    );
  }
}

class DeleteBanner extends ReactiveStatelessWidget {
  const DeleteBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors[Random().nextInt(colors.length)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'CONFIRMATION',
                    textScaleFactor: 1.3,
                  ),
                  const Text(
                      'this is will delete or reset your data. these are dangerous actions. select apropriate option for your needs.'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        RM.disposeAll();
                        await Future.delayed(const Duration(milliseconds: 1));
                        isInitialized = false;
                        BeseechApp.open(context);
                      },
                      child: const Text('RESET SETTINGS'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        RM.disposeAll();
                        await Future.delayed(const Duration(milliseconds: 1));
                        BeseechApp.open(context);
                        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      },
                      child: const Text('RESET COUNTERS'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        RM.disposeAll();
                        await Future.delayed(const Duration(milliseconds: 1));
                        isInitialized = false;
                        BeseechApp.open(context);
                        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      },
                      child: const Text('RESET ALL DATA'),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        },
                        label: const Text('CANCEL'),
                        icon: const Icon(Icons.cancel),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
