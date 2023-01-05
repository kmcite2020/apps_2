// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, avoid_print, unused_local_variable, unused_import, non_constant_identifier_names, use_function_type_syntax_for_parameters, prefer_const_constructors_in_immutables, unused_element, must_be_immutable, prefer_typing_uninitialized_variables, constant_identifier_names, body_might_complete_normally_nullable, annotate_overrides, prefer_const_literals_to_create_immutables

import "dart:async";
import "package:dashboard/core/authentication/register/register.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:material_design_icons_flutter/material_design_icons_flutter.dart";
import "package:states_rebuilder/states_rebuilder.dart";

import "apps/idealApp/controllers/core.dart";
import "assets/licenses.dart";
import "core/apps.dart";
import "core/authentication/authentication.dart";
import "core/authentication/login/login.dart";
import "core/reactiveModels.dart";
import "core/storage/hiveStorage.dart";
import "core/storage/sharedPreferences.dart";
import "core/themes/darkThemeData.dart";
import "core/themes/lightThemeData.dart";
import "core/themes/themes.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  addLicenses();
  RM.navigate.transitionsBuilder = RM.transitions.leftToRight();
  // await RM.storageInitializer(SharedPreferencesStore());
  await RM.storageInitializer(HiveStorage());
  await RM.storageInitializer(HiveStorage(name: "SECTIONS"));

  // sectionsRM.deletePersistState();
  await initDefaultImage;
  runApp(DASH());
}

class DASH extends ReactiveStatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      navigatorKey: RM.navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      themeMode: themeMode,
      darkTheme: darkThemeData,
      home: authenticated ? runSelectedApp : DASHBOARD(),
    );
  }
}

class DASHBOARD extends StatelessWidget {
  const DASHBOARD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "APPS",
        ),
        actions: [AppSelectorToggle()],
      ),
      body: authenticated
          ? GridView.count(
              crossAxisCount: 3,
              children: Apps.values.map(
                (eachApp) {
                  return Padding(
                    padding: EdgeInsets.all(padding),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(borderRadius),
                      onTap: () {
                        currentApp = eachApp;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              eachApp.iconData ?? MdiIcons.appsBox,
                              size: 70,
                            ),
                            Container(
                              padding: EdgeInsets.all(padding),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(borderRadius),
                              ),
                              child: Text(
                                eachApp.description,
                                textScaleFactor: .7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            )
          : LoginForm(),
    );
  }
}
