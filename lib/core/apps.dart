// ignore_for_file: prefer_const_constructors, unused_import, unused_element

import "dart:convert";

import 'package:dashboard/apps/opthalmologyApp/main.dart';
import "package:dashboard/core/authentication/login/login.dart";
import "package:dashboard/main.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:material_design_icons_flutter/material_design_icons_flutter.dart";
import "package:states_rebuilder/states_rebuilder.dart";

import "../apps/FCPS/FCPS.dart";
import "../apps/HiveDB/hiveDB.dart";
import "../apps/beseechApp/beseechApp.dart";
import "../apps/bloodPressureManagerApp/bloodPressureManagerApp.dart";
import "../apps/commonSymptomsApp/commonSymptomsApp.dart";
import "../apps/googleFontsViewerApp/googleFontsViewerApp.dart";
import "../apps/hmisApp/hmisApp.dart";
import "../apps/hospitalApp/hospitalApp.dart";
import "../apps/idealApp/ui/dashboard.dart";
import "authentication/authentication.dart";
import "../apps/prayersApp/prayerApp.dart";
import "../apps/prescriptionsApp/prescriptionsApp.dart";
import "../apps/settingsApp/settingsApp.dart";
import "../apps/taskManagerApp/taskManagerApp.dart";
import "../apps/timerApp/timerApp.dart";
import "../apps/todoApp/todoApp.dart";
import "../apps/userManagerApp/userManagerApp.dart";
import "reactiveModels.dart";
import "themes/themes.dart";

enum Apps {
  beseechApp("Beseech", MdiIcons.handBackRight),
  bloodPressureManagerApp("Blood Pressure Manager", MdiIcons.bloodBag),
  commonSymptomsApp("Common Symptoms", MdiIcons.commentPlus),
  userManagerApp("User Manager", MdiIcons.usb),
  fcpsApp("FCPS", MdiIcons.accessPoint),
  hiveDB("Hive DB Explorer", MdiIcons.database),
  googleFontsViewerApp("Google Fonts Viewer", MdiIcons.fontAwesome),
  hmisApp("HMIS", MdiIcons.heartFlash),
  hospitalApp("Hospital", MdiIcons.hospital),
  idealApp("URideal Store", MdiIcons.store),
  prayersApp("Prayers", MdiIcons.handBackLeft),
  prescriptionsApp("Prescriptions", MdiIcons.elevatorDown),
  opthalmologyApp("Opthalomology MCQs", MdiIcons.chatSleepOutline),
  quizManagerApp("Quiz Manager - for Quiz App", MdiIcons.chatQuestion),
  settingsApp("Settings", Icons.settings),
  taskManagerApp("Task Manager", MdiIcons.professionalHexagon),
  timerApp("Timer", MdiIcons.timelapse),
  todoApp("To-do", MdiIcons.note);

  const Apps(this.description, [this.iconData]);
  final String description;
  final IconData? iconData;
}

Widget get runSelectedApp {
  switch (currentApp) {
    case Apps.idealApp:
      return Dashboard();
    case Apps.opthalmologyApp:
      return OpthalomologyMCQsApp();
    case Apps.timerApp:
      return TimerApp();
    case Apps.quizManagerApp:
      return Dashboard();
    case Apps.prayersApp:
      return PrayersApp();
    case Apps.commonSymptomsApp:
      return CommonSymptomsApp();
    case Apps.hospitalApp:
      return hospitalApp;
    case Apps.prescriptionsApp:
      return PrescriptionsApp();
    case Apps.beseechApp:
      return BeseechApp();
    case Apps.bloodPressureManagerApp:
      return BloodPressureManagerApp();
    case Apps.userManagerApp:
      return UserManagerApp();
    case Apps.hmisApp:
      return HMIS();
    case Apps.settingsApp:
      return SettingsApp();
    case Apps.taskManagerApp:
      return TaskManagerApp();
    case Apps.todoApp:
      return TodoApp();
    case Apps.fcpsApp:
      return FCPS();
    case Apps.hiveDB:
      return HiveDB();
    case Apps.googleFontsViewerApp:
      return GoogleFontsViewerApp();
    case null:
      return DASHBOARD();
  }
}

class AppSelectorToggle extends ReactiveStatelessWidget {
  const AppSelectorToggle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            currentApp != null
                ? IconButton(
                    tooltip: "exit app",
                    onPressed: () => currentApp = null,
                    icon: Icon(
                      Icons.close,
                    ),
                  )
                : IconButton(
                    tooltip: authenticated ? "sign out from the apps" : "already signed out",
                    onPressed: authenticated ? () => signout() : null,
                    icon: Icon(
                      authenticated ? MdiIcons.logout : MdiIcons.login,
                    ),
                  ),
          ],
        ),
      );
}
