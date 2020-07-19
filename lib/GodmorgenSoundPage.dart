import 'package:flutter/material.dart';
import 'soundfile.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'PlaySong.dart';
import 'FavoritPage.dart';


class GodmorgenSoundPage extends StatefulWidget {
  static String tag = 'GodmorgenSoundPage';
  @override
  State<StatefulWidget> createState() {
    return GodmorgenSoundPageState();
  }



}

class GodmorgenSoundPageState extends State<GodmorgenSoundPage>{
  int _currentIndex = 0;
  int index = 0;
  List<bool> favList = [true];
  FavoritPage favoritPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Godmorgen'),
            //TODO add backgroundColor and opacity. What colour should the text be?
            backgroundColor: Color.fromRGBO(48, 121, 169, 1.0 )
        ),
        body: new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/BaggrundNY.png'),
                  fit: BoxFit.fill,
                )
            ) ,

            child: new Center(
              child: new Container(
                padding: EdgeInsets.all(5.0),
                color: Color.fromRGBO(241, 242, 245, 0.4),
                height: 400,
                width: 350,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      cardGodmorgenSoundFile1(index)
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
                //TODO Redirect to Facebook
                  break;
                case 1:
                //TODO Redirect to Instagram
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
                icon: new Image.asset('assets/icons/Facebook.png',
                  height: 40,
                  width: 60,),
                title: Text(''),
              ),
              new BottomNavigationBarItem(
                //Icon for Instagram
                  icon: new Image.asset('assets/icons/Instagram.png',
                    height: 40,
                    width: 60,),
                  title: new Text('')
              ),
              new BottomNavigationBarItem(
                //Icon for Formaal page
                icon: new Image.asset('assets/icons/Formaal.png',
                  height: 40,
                  width: 60,),
                title: new Text(''),
              ),
              new BottomNavigationBarItem(
                //Icon for Erfaringsgrundlag page
                icon: new Image.asset('assets/icons/Erfaringsgrundlag.png',
                  height: 40,
                  width: 60,),
                title: new Text(''),
              ),
            ],
          ),
        )
    );
  }

  Widget cardGodmorgenSoundFile1(int index) {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.8),
        child: new Container(
          child: ListTile(

            title: Text(godmorgenSoundFiles[0].title, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            leading: CircleAvatar(
              backgroundImage: AssetImage(godmorgenSoundFiles[0].imagepath),

            ),
            subtitle: Text(godmorgenSoundFiles[0].description, style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1))),
            trailing: favList[index] ? new Image.asset('assets/icons/heartUnfilled.png') : new Image.asset('assets/icons/heartFilled.png'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlaySong(
                              soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/Godmorgen.png', "Godmorgen",
                                  "Stående afspænding \n" + "11:27 min") ),
                    )
                );
              },
            onLongPress: () {
              //TODO add the selected soundFile to the Fav page
              favList[index] = !favList[index];
              setState(() {});

            },
          ),
        )
    );
  }



}



List<SoundFile> godmorgenSoundFiles = [
  SoundFile('music/Godmorgen.mp3', 'assets/images/Godmorgen.png', "Godmorgen",
      "Stående afspænding \n" + "11:27 min"),
  SoundFile("music/Frokostpausen.mp3", "assets/images/WalkingWhite.png",
      "Frokostpausen", "Gående afspænding \n" + "10:52 min"),
  SoundFile("music/DagensPusterum.mp3", "assets/images/CloudBubbleWhite.png",
      "Dagens pusterum", "Siddende afspænding \n" + "9:11 min"),
  SoundFile("music/StopopV1.1.mp3", "assets/images/StopWhite.png", "Stop op",
      "Liggende afspænding \n" + "12:11 min"),
  SoundFile(
      "music/SovgodtV1.1.mp3", "assets/images/SleepingWhite.png", "Sov godt",
      "Liggende afspænding \n" + "12:16 min"),
];

List<Widget> cardToFavourite = [];
