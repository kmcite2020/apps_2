// ignore_for_file: prefer_const_constructors, file_names

import "dart:convert";

import "package:dashboard/core/authentication/authentication.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:states_rebuilder/states_rebuilder.dart";
import "package:uuid/uuid.dart";

import "apps.dart";
import "authentication/userInformations.dart";
import "themes/themes.dart";

final _currentUser = RM.inject<UserModel?>(
  () => null,
  persist: () => PersistState(
    key: "currentUser",
    toJson: (s) => s!.toJson(),
    fromJson: (json) => UserModel.fromJson(json),
  ),
  dependsOn: DependsOn(
    {usersRM},
  ),
  autoDisposeWhenNotUsed: false,
);
set currentUser(value) => _currentUser.state = value;
UserModel? get currentUser => _currentUser.state;

final currentAppRM = RM.inject<Apps?>(
  () => null,
  // persist: () => PersistState(
  //   key: 'currentApp',
  //   toJson: (s) => jsonEncode(Apps.values.indexOf(s)),
  //   fromJson: (json) => Apps.values[jsonDecode(json)],
  // ),
);
Apps? get currentApp => currentAppRM.state;
set currentApp(value) => currentAppRM.state = value;

final _themeMode = RM.inject<ThemeMode>(
  () => ThemeMode.system,
  persist: () => PersistState(
    key: "themeMode",
    toJson: (s) => jsonEncode(themeModes.indexOf(s)),
    fromJson: (json) => themeModes[jsonDecode(json)],
  ),
);

final _color = RM.inject<MaterialColor>(
  () => Colors.blue,
  persist: () => PersistState(
    key: "color",
    toJson: (s) => jsonEncode(colors.indexOf(s)),
    fromJson: (json) => colors[jsonDecode(json)],
  ),
);

final _font = RM.inject<String>(
  () => fonts.first,
  persist: () => PersistState(key: "font"),
);

final _padding = RM.inject<double>(
  () => 10,
  persist: () => PersistState(key: "padding"),
);

final _borderRadius = RM.inject<double>(
  () => 10,
  persist: () => PersistState(key: "borderRadius"),
);

// final themeRM = RM.inject<ThemeData>(
//   () => lightThemeData,
//   dependsOn: DependsOn(dependers),
// );
// ThemeData get theme => themeRM.state;

// final darkThemeRM = RM.inject(
//   () => darkThemeData,
//   dependsOn: DependsOn(dependers),
// );
// ThemeData get darkTheme => darkThemeRM.state;

ThemeMode get themeMode => _themeMode.state;
set themeMode(value) => _themeMode.state = value;
List<ThemeMode> get themeModes => ThemeMode.values;

MaterialColor get color => _color.state;
set color(value) => _color.state = value;
List<MaterialColor> get colors => Colors.primaries;

String get font => _font.state;

set font(value) => _font.state = value;

List<String> get fonts {
  return [
    "Azeret Mono",
    "Comfortaa",
    "DM Mono",
    "Dosis",
    "Fira Sans",
    "IBM Plex Mono",
    "Josefin Sans",
    "Montserrat",
    "Space Mono",
    "Ubuntu",
  ];
}

// String googleFont(String font) {}

double get borderRadius => _borderRadius.state;
set borderRadius(value) => _borderRadius.state = value;
double get padding => _padding.state;
set padding(value) => _padding.state = value;

/// UTILS
String getGoogleFont(x) {
  return GoogleFonts.getFont(x).fontFamily!;
}

String get randomID => Uuid().v1();

// final dependers = {
//   _themeMode,
//   _font,
//   _color,
//   _padding,
//   _borderRadius,
// };

List<Widget> themingWidgets(size) {
  return [
    UserInformations(),
    ThemeModeChanger(),
    ColorChanger(size),
    FontChanger(),
    BorderRadiusChanger(),
    PaddingChanger(),
  ];
}

double get appBarHeight {
  if (padding <= 10) {
    return 60;
  } else if (padding <= 15 && padding > 10) {
    return padding * 6;
  } else {
    return 90;
  }
}

bool get authenticated => currentUser != null;
void signout() {
  currentUser = null;
  exitApp();
}

void exitApp() => currentApp = null;
