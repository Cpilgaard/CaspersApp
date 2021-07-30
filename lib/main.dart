import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testpust/Subscription.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'ListSoundFiles.dart';
import 'Forside.dart';
import 'Components.dart';
import 'PurchaseButton.dart';
import 'package:purchases_flutter/purchases_flutter.dart';



void main() async {

  Package package;
  Offerings offering;

  // fix screen orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new ListSoundFiles(),
    routes: <String, WidgetBuilder>{
      DitUdbytte.tag: (BuildContext context) => new DitUdbytte(),
      ListSoundFiles.tag: (BuildContext context) => new ListSoundFiles(),
      Erfaringsgrundlag.tag: (BuildContext context) => new Erfaringsgrundlag(),
      Subscription.tag: (BuildContext context) => new Subscription(offerings: offering),
      Forside.tag: (BuildContext context) => new Forside(),
      PurchaseButton.tag: (BuildContext context) => new PurchaseButton(package: package)
    },
  ));

  initPlatformState();
}

Future<void> initPlatformState() async {
  appData.isPro = false;

  await Purchases.setDebugLogsEnabled(true);
  await Purchases.setup("dOiMTGbwsNSDKeVbNgPrixoiWpuHrYhx");



  PurchaserInfo purchaserInfo;
  try {
  purchaserInfo = await Purchases.getPurchaserInfo();
  print(purchaserInfo.toString());
  if (purchaserInfo.entitlements.all['all_features'] != null) {
  appData.isPro = purchaserInfo.entitlements.all['all_features'].isActive;
  } else {
  appData.isPro = false;
  }
  } on PlatformException catch (e) {
  print(e);
  }

  print('#### is user pro? ${appData.isPro}');
}

