import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:testpust/Components.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:testpust/ListSoundFiles.dart';

PurchaserInfo _purchaserInfo;


class PurchaseButton extends StatefulWidget {


  final Package package;

  PurchaseButton({Key key, @required this.package}) : super(key: key);

  static String tag = 'PurchaseButton';
  @override
  _PurchaseButtonState createState() => _PurchaseButtonState();
}

class _PurchaseButtonState extends State<PurchaseButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child:
      Container(
        width: 350,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
        color: Color.fromRGBO(241, 242, 245, 0.6),
        child: RaisedButton(
          disabledColor: Color.fromRGBO(
              46, 91, 140, 1),
          color: Color.fromRGBO(46, 91, 140, 1),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(
                45.0),
          ),
          elevation: 10,
          child: new Text("KØB",
            style: TextStyle(color: Colors.white),),
          onPressed: () async {
            try {
              print('now  trying to purchase');
              _purchaserInfo =
              await Purchases.purchasePackage(widget.package);
              print('purchase completed');

              appData.isPro =
                  _purchaserInfo.entitlements.all["all_features"]
                      .isActive;

              print('is user pro? ${appData.isPro}');

              if (appData.isPro) {
                Alert(
                  context: context,
                  title: "Tillykke",
                  content: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
                        child: Text(
                          "Du har nu abonnement til alt i app'en",
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                              color: Color.fromRGBO(46, 91, 140, 1),
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      radius: BorderRadius.circular(10),
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      width: 127,
                      color: Color.fromRGBO(46, 91, 140, 1),
                      height: 52,
                    ),
                  ],
                ).show();
              } else {
                Alert(
                  context: context,
                  title: "Køb fejlede",
                  content: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
                        child: Text(
                          'Der skete en fejl. Prøv igen senere',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(46, 91, 140, 1),
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      radius: BorderRadius.circular(10),
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      width: 127,
                      color: Color.fromRGBO(46, 91, 140, 1),
                      height: 52,
                    ),
                  ],
                ).show();
              }
            } on PlatformException catch (e) {
              print('----xx-----');
              var errorCode = PurchasesErrorHelper.getErrorCode(e);
              if (errorCode ==
                  PurchasesErrorCode.purchaseCancelledError) {
                print("User cancelled");
              } else if (errorCode ==
                  PurchasesErrorCode.purchaseNotAllowedError) {
                print("User not allowed to purchase");
              }
              Alert(
                context: context,
                title: "Køb fejlede",
                content: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
                      child: Text(
                        'Der skete en fejl. Prøv igen senere',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(46, 91, 140, 1),
                              fontSize: 14),
                      ),
                    )
                  ],
                ),
                buttons: [
                  DialogButton(
                    radius: BorderRadius.circular(10),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    width: 127,
                    color: Color.fromRGBO(46, 91, 140, 1),
                    height: 52,
                  ),
                ],
              ).show();
            }
            return ListSoundFiles();
          },
        ),
      ),
    );
  }

  var kWelcomeAlertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    animationDuration: Duration(milliseconds: 450),
    backgroundColor: Color.fromRGBO(241, 242, 245, 0.6),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    titleStyle: TextStyle(
      color: Color.fromRGBO(46, 91, 140, 1),
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      letterSpacing: 1.5,
    ),
  );

  TextStyle kSendButtonTextStyle = TextStyle(
    color: Color.fromRGBO(46, 91, 140, 1),
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}
