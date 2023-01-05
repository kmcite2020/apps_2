// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:dashboard/core/apps.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

/// DATA SUPPORT
final deafultStartPageValues = [
  'Processes',
  'Performance',
  'App history',
  'Startup apps',
  'Users',
  'Details',
  'Services',
];
final realtimeUpdateSpeedValues = [
  'High',
  'Normal',
  'Low',
  'Paused',
];

/// Models
final defaultStartPageFieldRM = RM.inject<String?>(() => deafultStartPageValues.first);
final realtimeUpdateSpeedRM = RM.inject<String?>(() => realtimeUpdateSpeedValues.first);

/// Window Management
final alwaysOnTopRM = RM.inject(() => false);
final minimizeOnUseRM = RM.inject(() => false);
final hideWhenMinimizedRM = RM.inject(() => false);

/// Other Options
final showFullAccountNameRM = RM.inject(() => false);
final showHistoryForAllProcessesRM = RM.inject(() => false);

class TaskManagerApp extends ReactiveStatelessWidget {
  const TaskManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Manger - Settings"),
        actions: [AppSelectorToggle()],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Settings",
              textScaleFactor: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Default Start Page',
              textScaleFactor: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: 'Processes',
              items: deafultStartPageValues
                  .map(
                    (String e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                defaultStartPageFieldRM.state = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Real time update speed',
              textScaleFactor: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: 'High',
              items: realtimeUpdateSpeedValues
                  .map(
                    (String e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                realtimeUpdateSpeedRM.state = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Window management',
              textScaleFactor: 2,
            ),
          ),
          CheckboxListTile(
            title: Text('Always on top'),
            value: alwaysOnTopRM.state,
            onChanged: (v) => alwaysOnTopRM.state = v!,
          ),
          CheckboxListTile(
            title: Text('Minimize on use'),
            value: minimizeOnUseRM.state,
            onChanged: (v) => minimizeOnUseRM.state = v!,
          ),
          CheckboxListTile(
            title: Text('Hide when minimized'),
            value: hideWhenMinimizedRM.state,
            onChanged: (v) => hideWhenMinimizedRM.state = v!,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Other options',
              textScaleFactor: 2,
            ),
          ),
          CheckboxListTile(
            title: Text('Show full account name'),
            value: showFullAccountNameRM.state,
            onChanged: (v) => showFullAccountNameRM.state = v!,
          ),
          CheckboxListTile(
            title: Text('Show history for all processes'),
            value: showHistoryForAllProcessesRM.state,
            onChanged: (v) => showHistoryForAllProcessesRM.state = v!,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RM.navigate.to(
            NextPage(
              {
                "defaultStartPageFieldRM": defaultStartPageFieldRM.state,
                "realtimeUpdateSpeedRM": realtimeUpdateSpeedRM.state,
                "alwaysOnTopRM": alwaysOnTopRM.state,
                "minimizeOnUseRM": minimizeOnUseRM.state,
                "hideWhenMinimizedRM": hideWhenMinimizedRM.state,
                "showFullAccountNameRM": showFullAccountNameRM.state,
                "showHistoryForAllProcessesRM": showHistoryForAllProcessesRM.state,
              },
            ),
          );
        },
        tooltip: 'save settings',
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NextPage extends ReactiveStatelessWidget {
  const NextPage(this.data, {super.key});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings - Retrieved'),
      ),
      body: Row(
        children: [
          Column(
            children: [
              for (final eachData in data.keys)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    eachData.toString(),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              for (final eachData in data.values)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    eachData.toString(),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
