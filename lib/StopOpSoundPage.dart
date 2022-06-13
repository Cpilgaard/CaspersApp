import 'package:flutter/material.dart';
import 'package:testpust/global_strings.dart';
import 'Subscription.dart';
import 'soundfile.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'PlaySong.dart';
import 'FavoritPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ListSoundFiles.dart';


class StopOpSoundPage extends StatefulWidget {
  static String tag = 'StopOpSoundPage';
  @override
  State<StatefulWidget> createState() {
    return StopOpSoundPageState();
  }



}

class StopOpSoundPageState extends State<StopOpSoundPage>{
  int index = 0;
  FavoritPage favoritPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Stop Op'),
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
                icon: Icon(Icons.home, size: 35, color: Color.fromRGBO(142, 210, 238, 1.0)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => ListSoundFiles()
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
                padding: EdgeInsets.all(5.0),
                color: Color.fromRGBO(241, 242, 245, 0.55),
                height: 400,
                width: 350,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      cardStopOpSoundFile0(index),
                      cardStopOpSoundFile1(index),
                      cardStopOpSoundFile2(index),
                      cardStopOpSoundFile3(index),
                      cardStopOpSoundFile4(index),
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
            //currentIndex: _currentIndex,
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
                // Redirects to Subscription
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription()));
                  break;
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
                label: '',
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
                label: '',
              ),
              new BottomNavigationBarItem(
                //Icon for Subscription page
                icon: new Image.asset(betalingImage,
                  height: 40,
                  width: 60,),
                label: '',
              ),
              new BottomNavigationBarItem(
                //Icon for Erfaringsgrundlag page
                icon: new Image.asset(erfaringsgrundlagImage,
                  height: 40,
                  width: 60,),
                label: '',
              ),
            ],
          ),
        )
    );
  }

  Widget cardStopOpSoundFile0(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
            child: new Container(
              child: ListTile(
                title: Text(stopOpSoundFiles[0].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(stopOpSoundFiles[0].imagepath),

                ),
                subtitle: Text(stopOpSoundFiles[0].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
                trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaySong(
                                  soundFile: stopOpSoundFiles[0]),
                        )
                    );
                  },
          ),
        ),
    );
  }

  Widget cardStopOpSoundFile1(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(stopOpSoundFiles[1].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(stopOpSoundFiles[1].imagepath),

            ),
            subtitle: Text(stopOpSoundFiles[1].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: stopOpSoundFiles[1]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardStopOpSoundFile2(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(stopOpSoundFiles[2].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(stopOpSoundFiles[2].imagepath),

            ),
            subtitle: Text(stopOpSoundFiles[2].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: stopOpSoundFiles[2]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardStopOpSoundFile3(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(stopOpSoundFiles[3].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(stopOpSoundFiles[3].imagepath),

            ),
            subtitle: Text(stopOpSoundFiles[3].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: stopOpSoundFiles[3]),
                  )
              );
            },
          ),
        )
    );
  }

  Widget cardStopOpSoundFile4(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.9),
        child: new Container(
          child: ListTile(

            title: Text(stopOpSoundFiles[4].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(stopOpSoundFiles[4].imagepath),

            ),
            subtitle: Text(stopOpSoundFiles[4].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlaySong(
                            soundFile: stopOpSoundFiles[4]),
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

List<SoundFile> stopOpSoundFiles = [
  SoundFile('music/Stopop1.mp3', 'assets/images/StopOp.png', "En rolig vejrtrækning",
      "En liggende afspændingsøvelse 17:06 min"),
  SoundFile("music/Stopop2.mp3", "assets/images/StopOp.png",
      "Kom ned i tempo", "En liggende afspændingsøvelse 15:33 min"),
  SoundFile("music/Stopop3.mp3", "assets/images/StopOp.png",
      "En nænsom pause", "En siddende udendørs afspændingsøvelse 12:07 min"),
  SoundFile("music/Stopop4.mp3", "assets/images/StopOp.png", "Balance i hverdagen",
      "En liggende afspændingsøvelse 17:34 min"),
  SoundFile(
      "music/Stopop5.mp3", "assets/images/StopOp.png", "Kom til stede i dig selv",
      "En liggende progressiv afspænding 14:35 min"),
];


