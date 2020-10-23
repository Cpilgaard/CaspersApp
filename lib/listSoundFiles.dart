import 'package:sqflite/sqflite.dart';
import 'package:testpust/DitUdbytte.dart';
import 'package:testpust/GodmorgenSoundPage.dart';
import 'package:testpust/Profil.dart';
import 'package:testpust/FavoritPage.dart';
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
  remindLaunches: 1,
);


class ListSoundFiles extends StatefulWidget {
  static String tag =  'ListSound';
  @override
  State<StatefulWidget> createState() {
    return new ListSoundFilesState();
  }
}

class ListSoundFilesState extends State<ListSoundFiles> {
  int _currentIndex = 0;
  void initState() {
    _rateMyApp.init().then((_) {
      //To test the implementation of the showRateDialog, uncomment this if statement
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
  }

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
              case 3:
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
              title: Text(''),
          ),
            new BottomNavigationBarItem(
            //Icon for Instagram
              icon: new Image.asset(instagramImage,
                height: 40,
                width: 60,),
              title: new Text('')
          ),
            new BottomNavigationBarItem(
            //Icon for Formaal page
            icon: new Image.asset(formaalImage,
              height: 40,
              width: 60,),
            title: new Text(''),
          ),
            new BottomNavigationBarItem(
            //Icon for Erfaringsgrundlag page
              icon: new Image.asset(erfaringsgrundlagImage,
                height: 40,
                width: 60,),
              title: new Text(''),
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
              subtitle: Text("Guidede afspændingsøvelser til den gode start på din dag", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
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
            subtitle: Text("Guidede afspændingsøvelser, under åben himmel", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
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

  Widget _cardDagensPusterum() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[2].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/DagensPusterum.png'),

            ),
            subtitle: Text("Guidede afspændings-øvelser til alle tidspunkter på din dag", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
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

  Widget _cardStopOp() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[3].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/StopOp.png'),

            ),
            subtitle: Text("Guidede afspændings-øvelser til når din krop er stresset", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
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

  Widget _cardSovGodt() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(
            title: Text(soundFiles[4].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/SovGodt.png'),

            ),
            subtitle: Text("Guidede afspændings-øvelser til din gode søvn", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
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
