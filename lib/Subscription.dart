import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
//import 'package:purchases_flutter/purchases_flutter.dart';
//import 'package:testpust/PurchaseButton.dart';
import 'package:testpust/global_strings.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'FavoritPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ListSoundFiles.dart';

class Subscription extends StatefulWidget {

  static String tag = 'Subscription';

 // final Offerings offerings;
 //Subscription({Key key, @required this.offerings}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new SubscriptionState();
  }
}

class SubscriptionState extends State<Subscription> {
//  StreamSubscription _conectionSubscription;

  @override
  void initState() {
    super.initState();
   // asyncInitState(); // async is not allowed on initState() directly
  }

/*  @override
  void dispose() {
    if (_conectionSubscription != null) {
      _conectionSubscription.cancel();
      _conectionSubscription = null;
    }
  }

  void asyncInitState() async {
    await FlutterInappPurchase.instance.initConnection;
    _conectionSubscription = FlutterInappPurchase.connectionUpdated.listen((connected) {
      print('connected: $connected');
    });
  }*/


  @override
  Widget build(BuildContext context) {
/*    if (widget.offerings != null) {
      print('offeringS is not null');
      print(widget.offerings.current.toString());
      print('--');
      print(widget.offerings.toString());
      final offering = widget.offerings.current;
      if (offering != null) {
        final monthly = offering.monthly;
        if (monthly != null) {*/
          return Scaffold(
              appBar: AppBar(
                  title: Text('Abonnement'),
                  actions: <Widget>[
                    IconButton(
                      icon: new Image.asset(heartFilledAppBarImage),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => FavoritPage()
                        )
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.home, size: 35,
                          color: Color.fromRGBO(142, 210, 238, 1.0)),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => ListSoundFiles()
                        )
                        );
                      },
                    )
                  ],
                  backgroundColor: Color.fromRGBO(48, 121, 169, 1.0)
              ),
              body: new Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.fill,
                      )
                  ),

                  child: new Center(
                    child: new Container(
                      padding: EdgeInsets.all(20.0),
                      color: Color.fromRGBO(241, 242, 245, 0.4),
                      height: 425,
                      width: 350,
                      child: new Container(
                        child: new SingleChildScrollView(
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 350,
                                  padding: EdgeInsets.all(20.0),
                                  color: Color.fromRGBO(241, 242, 245, 0.6),
                                  child: Text("Betaling",
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 91, 140, 1),
                                        fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 350,
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  color: Color.fromRGBO(241, 242, 245, 0.6),
                                  child: Text("Pris 23,00 kr/md",
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 91, 140, 1),
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                /*Container(
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
                                    onPressed: () =>
                                        PurchaseButton(package: monthly),
                                    child: new Text("KØB",
                                      style: TextStyle(color: Colors.white),),
                                  ),
                                ),*/
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 2, 20, 20),
                                  color: Color.fromRGBO(241, 242, 245, 0.6),
                                  child: Text(subscriptionText,
                                    style: TextStyle(
                                        color: Color.fromRGBO(46, 91, 140, 1),
                                        fontSize: 14),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              bottomNavigationBar: new Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: Color.fromRGBO(48, 121, 169, 1.0)
                ),
                child: new BottomNavigationBar(
                  // Gets the index of the pressed item. Switch case is used for redirecting to
                  // the different pages
                  //currentIndex: _currentIndex,
                  onTap: (int index) {
                    switch (index) {
                      case 0:
                      //Redirects to Facebook
                        launchURL(facebookURL);
                        break;
                      case 1:
                      //Redirects to Instagram
                        launchURL(instagramURL);
                        break;
                      case 2:
                      // Redirects to Dit Udbytte / Formål
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DitUdbytte()));
                        break;
                      case 3:
                      // Redirects to Subscription
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription()));
                      //break;
                      case 4:
                      // Redirects to Erfaringsgrundlag
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Erfaringsgrundlag()));
                        break;
                    }
                  },
                  type: BottomNavigationBarType.fixed,
                  items: <BottomNavigationBarItem>[
                    new BottomNavigationBarItem(
                      //Icon for FB
                      icon: new Image.asset(facebookImage,
                        height: 40,
                        width: 60,),
                      label: ''
                    ),
                    new BottomNavigationBarItem(
                      //Icon for Instagram
                        icon: new Image.asset(instagramImage,
                          height: 40,
                          width: 60,),
                      label: ''
                    ),
                    new BottomNavigationBarItem(
                      //Icon for Formaal page
                      icon: new Image.asset(formaalImage,
                        height: 40,
                        width: 60,),
                      label: ''
                    ),
                    new BottomNavigationBarItem(
                      //Icon for Subscription page
                      icon: new Image.asset(betalingImage,
                        height: 40,
                        width: 60,),
                      label: ''
                    ),
                    new BottomNavigationBarItem(
                      //Icon for Erfaringsgrundlag page
                      icon: new Image.asset(erfaringsgrundlagImage,
                        height: 40,
                        width: 60,),
                      label: ''
                    ),
                  ],
                ),
              )
          );
        }
      }
  //  }
 // }


  launchURL(String string) async {
    String url = string;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
