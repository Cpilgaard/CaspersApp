import 'package:flutter/services.dart';
//import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
//import 'package:purchases_flutter/purchases_flutter.dart';
//import 'package:testpust/Components.dart';
import 'package:testpust/DagensPusterumSoundPage.dart';
import 'package:testpust/DitUdbytte.dart';
import 'package:testpust/FrokostSoundPage.dart';
import 'package:testpust/GodmorgenSoundPage.dart';
import 'package:testpust/Profil.dart';
import 'package:testpust/FavoritPage.dart';
import 'package:testpust/SovGodtSoundPage.dart';
import 'package:testpust/StopOpSoundPage.dart';
//import 'package:testpust/Subscription.dart';
import 'package:testpust/global_strings.dart';
import 'soundfile.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:url_launcher/url_launcher.dart';



RateMyApp _rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 0,
  minLaunches: 3,
  remindDays: 1,
  remindLaunches: 3,
  googlePlayIdentifier: 'biegel.DitPusterum',
  appStoreIdentifier: '1489489646',
);



class ListSoundFiles extends StatefulWidget {
  static String tag =  'ListSound';
  @override
  State<StatefulWidget> createState() {
    return new ListSoundFilesState();
  }
}

class ListSoundFilesState extends State<ListSoundFiles> {
/*  Offerings _offerings;
  PurchaserInfo _purchaserInfo;*/

  int _currentIndex = 0;
  void initState() {
    _rateMyApp.init().then((_) {
      //To android_splash the implementation of the showRateDialog, uncomment this if statement
      if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showRateDialog(
          context,
          title: 'Bedøm denne app',
          message:
          'Hvis du kan lide denne app, så brug venligst et minut på at bedømme denne!',
          rateButton: 'BEDØM',
          noButton: 'NEJ TAK',
          laterButton: 'MÅSKE SENERE',
          ignoreIOS: false,
          dialogStyle: DialogStyle(),
        );
      }
    });
    super.initState();
    //fetchData();
  }


 /* Future<void> fetchData() async {
    PurchaserInfo purchaserInfo;
    try {
      purchaserInfo = await Purchases.getPurchaserInfo();
    } on PlatformException catch (e) {
      print(e);
    }


    Offerings offerings;
    try {
      offerings = await Purchases.getOfferings();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _purchaserInfo = purchaserInfo;
      _offerings = offerings;
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Afspændingssekvenser'),
            actions: <Widget>[
              IconButton(
                icon: new Image.asset(heartFilledAppBarImage,),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => FavoritPage()
                  )
                  );
                },
              )
            ],
          backgroundColor: Color.fromRGBO(48, 121, 169, 1.0 )
        ),
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.fill,
            )
          ) ,
            child: new Center(
              child: new Container(
                padding: EdgeInsets.all(5),
                color: Color.fromRGBO(241, 242, 245, 0.4),
                height: 400,
                width: 350,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _cardGodmorgen(),
                      _cardFrokostpausen(),
                      _cardDagensPusterum(),
                      _cardStopOp(),
                      _cardSovGodt()
                    ],
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
          currentIndex: _currentIndex,
          onTap: (int index) {
            switch(index){
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
                  break;
/*              case 3:
              // Redirects to Subscription
                Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription()));
                break;*/
              case 4:
              // Redirects to Erfaringsgrundlag
                Navigator.push(context, MaterialPageRoute(builder: (context) => Erfaringsgrundlag()));
                break;
            }
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem> [
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


  Widget _cardGodmorgen() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
              title: Text(soundFiles[0].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
              leading: CircleAvatar(
                backgroundImage: AssetImage(soundFiles[0].imagepath),

              ),
              subtitle: Text("Guidede afspændingsøvelser til den gode start på dagen", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
              trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => GodmorgenSoundPage()
                )
                );
            },
          ),
        )
    );
  }

  Widget _cardFrokostpausen() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[1].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/FrokostPausen.png'),

            ),
            subtitle: Text("Guidede afspændingsøvelser under åben himmel", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => FrokostSoundPage()
              )
              );
            },
          ),
        )
    );
  }

  Widget _cardDagensPusterum() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[2].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/DagensPusterum.png'),

            ),
            subtitle: Text("Guidede afspændingsøvelser til alle tidspunkter på din dag", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => DagensPusterumSoundPage()
              )
              );
            },
          ),
        )
    );
  }

  Widget _cardStopOp() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[3].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/StopOp.png'),

            ),
            subtitle: Text("Guidede afspændingsøvelser til når din krop er stresset", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => StopOpSoundPage()
              )
              );
            },
          ),
        )
    );
  }

  Widget _cardSovGodt() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[4].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/SovGodt.png'),

            ),
            subtitle: Text("Guidede afspændingsøvelser til en god og naturlig søvn", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => SovGodtSoundPage()
              )
              );
            },
          ),
        )
    );
  }

  launchURL(String string) async {
    String url = string;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

  List<SoundFile> soundFiles = [
    SoundFile('music/Godmorgen.mp3', 'assets/images/Godmorgen.png', "Godmorgen",
        "Stående afspænding \n" + "11:27 min"),
    SoundFile("music/Frokostpausen.mp3", "assets/images/FrokostPausen.png",
        "Frokostpausen", "Gående afspænding \n" + "10:52 min"),
    SoundFile("music/DagensPusterum.mp3", "assets/images/DagensPusterum.png",
        "Dagens pusterum", "Siddende afspænding \n" + "9:11 min"),
    SoundFile("music/StopopV1.1.mp3", "assets/images/StopOp.png", "Stop op",
        "Liggende afspænding \n" + "12:11 min"),
    SoundFile(
        "music/SovgodtV1.1.mp3", "assets/images/SovGodt.png", "Sov godt",
        "Liggende afspænding \n" + "12:16 min"),
  ];