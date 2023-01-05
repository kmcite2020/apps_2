import 'package:flutter/services.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final databaseRM = RM.inject(
  () => "DEFAULT",
);
String get database => databaseRM.state;
set database(value) => databaseRM.state = value;

late Uint8List defaultImage;
Future<void> get initDefaultImage async {
  ByteData bytes = await rootBundle.load('lib/assets/icon.png');
  defaultImage = bytes.buffer.asUint8List();
}
