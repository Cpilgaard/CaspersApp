import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'ListSoundFiles.dart';
import 'Forside.dart';

void main() async {
  // fix screen orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Forside(),
    routes: <String, WidgetBuilder>{
      DitUdbytte.tag: (BuildContext context) => new DitUdbytte(),
      ListSoundFiles.tag: (BuildContext context) => new ListSoundFiles(),
      Erfaringsgrundlag.tag: (BuildContext context) => new Erfaringsgrundlag(),
      Forside.tag: (BuildContext context) => new Forside()
    },
  ));
}
