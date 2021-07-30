import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:purchases_flutter/package_wrapper.dart';
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
      child: Container(
        color: Color.fromRGBO(241, 242, 245, 0.4),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: RaisedButton(
                onPressed: () async {
                  try {
                    print('now  trying to purchase');
                    _purchaserInfo = await Purchases.purchasePackage(widget.package);
                    print('purchase completed');

                    appData.isPro = _purchaserInfo.entitlements.all["all_features"].isActive;

                    print('is user pro? ${appData.isPro}');

                    if (appData.isPro) {
                      Alert(
                        context: context,
                        style: kWelcomeAlertStyle,
                        title: "Congratulation",
                        content: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
                              child: Text(
                                'Well done, you now have full access to the app',
                                textAlign: TextAlign.center,
                                style: kSendButtonTextStyle,
                              ),
                            )
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            radius: BorderRadius.circular(10),
                            child: Text(
                              "COOL",
                              style: kSendButtonTextStyle,
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            width: 127,
                            color: Colors.blue,
                            height: 52,
                          ),
                        ],
                      ).show();
                    } else {
                      Alert(
                        context: context,
                        style: kWelcomeAlertStyle,
                        image: Image.asset(
                          "assets/images/avatar_demo.png",
                          height: 150,
                        ),
                        title: "Error",
                        content: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
                              child: Text(
                                'There was an error. Please try again later',
                                textAlign: TextAlign.center,
                                style: kSendButtonTextStyle,
                              ),
                            )
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            radius: BorderRadius.circular(10),
                            child: Text(
                              "COOL",
                              style: kSendButtonTextStyle,
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            width: 127,
                            color: Colors.blue,
                            height: 52,
                          ),
                        ],
                      ).show();
                    }
                  } on PlatformException catch (e) {
                    print('----xx-----');
                    var errorCode = PurchasesErrorHelper.getErrorCode(e);
                    if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
                      print("User cancelled");
                    } else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
                      print("User not allowed to purchase");
                    }
                    Alert(
                      context: context,
                      style: kWelcomeAlertStyle,
                      image: Image.asset(
                        "assets/images/avatar_demo.png",
                        height: 150,
                      ),
                      title: "Error",
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
                            child: Text(
                              'There was an error. Please try again later',
                              textAlign: TextAlign.center,
                              style: kSendButtonTextStyle,
                            ),
                          )
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          radius: BorderRadius.circular(10),
                          child: Text(
                            "COOL",
                            style: kSendButtonTextStyle,
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
                textColor: Color.fromRGBO(46, 91, 140, 1),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Buy ${widget.package.product.title}\n${widget.package.product.priceString}',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
              child: Text(
                '${widget.package.product.description}',
                textAlign: TextAlign.center,
                style: kSendButtonTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            )
          ],
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