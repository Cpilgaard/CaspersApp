import 'soundfile.dart';
import 'PlaySong.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';


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
          //TODO add backgroundColor and opacity. What colour should the text be?
          backgroundColor: Color.fromRGBO(48, 121, 169, 1.0)
        ),
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/images/Baggrundtest.png'),
            fit: BoxFit.fill,
            )
          ) ,
            child: new Center(
              child: new SingleChildScrollView(
                padding: EdgeInsets.all(60.0),
                 child: new Column(
                  children: <Widget>[
                    //Card for Godmorgen.
                    _cardGodmorgen(),
                    //Card for Frokostpause
                    _cardFrokostPausen(),
                    // Card for DAGENS PUSTERUM
                    _cardDagensPusterum(),
                    // Card for STOP OP
                    _cardStopOp(),
                    //Card for SOV GODT
                    _cardSovGodt()
                  ]
                 )
              )
            )
        ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(48, 121, 169, 1.0)
        ),
        child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem> [
          new BottomNavigationBarItem(
            //TODO Redirect to Facebook
              icon: Icon(Icons.build, color: Color.fromRGBO(241, 242, 245, 0.6)),
              title: Text(''),
          ),
          new BottomNavigationBarItem(
            //TODO redirect to Instagram
              icon: Icon(Icons.title, color: Color.fromRGBO(241, 242, 245, 0.6)),
              title: new Text('')
          ),
          new BottomNavigationBarItem(
            //TODO redirect to Formål page
            icon: Icon(Icons.info, color: Color.fromRGBO(241, 242, 245, 0.6)),
            title: new Text('')
          ),
          new BottomNavigationBarItem(
            //TODO redirect to Erfaringsgrundlag page
              icon: Icon(Icons.person, color: Color.fromRGBO(241, 242, 245, 0.6)),
              title: new Text(''),

          ),
        ],
      ),
      )
      );


  }


  Widget _cardGodmorgen() {
    return new Card(
        color: Color.fromRGBO(241, 242, 245, 0.6),
        child: new Container(
            child: new Container(
              padding: EdgeInsets.all(10.0),
              child: ExpansionTile(
                  title: Text("Godmorgen"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(soundFiles[0].imagepath),
                  ),
                  children: <Widget>[
                    //Container for 1.lydfil til kategori GODMORGEN
                    new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: ListTile(
                            title: Text(soundFiles[0].title),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(soundFiles[0].imagepath),
                            ),
                            subtitle: Text(soundFiles[0].description),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlaySong(
                                              soundFile: SoundFile(soundFiles[0].filepath, soundFiles[0].imagepath, soundFiles[0].title, soundFiles[0].description)
                                          )
                                  )
                              );
                            }
                        )
                    ),
                    // Container for 2.lydfil til kategori GODMORGEN
                    new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: ListTile(
                            title: Text("Godmorgen2"),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/CupWhite.png'),
                            ),
                            subtitle: Text("Stående afspænding \n" + "11:27 min"),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PlaySong(
                                            soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
                                                "Stående afspænding \n" + "11:27 min") ),
                                  )
                              );
                            }
                        )
                    )
                  ]
              ),
            )
        )
    );
  }


  Widget _cardFrokostPausen() {
    return new Card(
      color: Color.fromRGBO(241, 242, 245, 0.6),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Container(
          child: ExpansionTile(
              title: Text("Frokostpausen"),
              leading: CircleAvatar(
                backgroundImage: AssetImage(soundFiles[1].imagepath),
              ),
              children: <Widget>[
                //Container for 1.lydfil for kategori FROKOSTPAUSEN
                new Container(
                    padding: new EdgeInsets.all(5.0),
                    child: ListTile(
                        title: Text(soundFiles[1].title),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[1].imagepath),
                        ),
                        subtitle: Text(soundFiles[1].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PlaySong(
                                          soundFile: SoundFile(soundFiles[1].filepath, soundFiles[1].imagepath, soundFiles[1].title, soundFiles[1].description)
                                      )
                              )
                          );
                        }
                    )
                ),
                // Container for 2.lydfil til kategori FROKOSTPAUSEN
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text("Frokost2"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[1].imagepath),
                        ),
                        subtitle: Text(soundFiles[1].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaySong(
                                        soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
                                            "Stående afspænding \n" + "11:27 min") ),
                              )
                          );
                        }
                    )
                )
              ]
          ),
        ),
      ),
    );
  }

  Widget _cardDagensPusterum() {
    return new Card(
      color: Color.fromRGBO(241, 242, 245, 0.6),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Container(
          child: ExpansionTile(
              title: Text("Dages Pusterum"),
              leading: CircleAvatar(
                backgroundImage: AssetImage(soundFiles[2].imagepath),
              ),
              children: <Widget>[
                //Container for 1.lydfil for kategori DAGENS PUSTERUM
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text(soundFiles[2].title),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[2].imagepath),
                        ),
                        subtitle: Text(soundFiles[1].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PlaySong(
                                          soundFile: SoundFile(soundFiles[2].filepath, soundFiles[2].imagepath, soundFiles[2].title, soundFiles[2].description)
                                      )
                              )
                          );
                        }
                    )
                ),
                // Container for 2.lydfil til kategori DAGENS PUSTERUM
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text("Dagens Pusterum2"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[2].imagepath),
                        ),
                        subtitle: Text(soundFiles[2].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaySong(
                                        soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
                                            "Stående afspænding \n" + "11:27 min") ),
                              )
                          );
                        }
                    )
                )
              ]
          ),
        ),
      ),
    );
  }


  Widget _cardStopOp() {
    return new Card(
      color: Color.fromRGBO(241, 242, 245, 0.6),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Container(
          child: ExpansionTile(
              title: Text(soundFiles[3].title),
              leading: CircleAvatar(
                backgroundImage: AssetImage(soundFiles[3].imagepath),
              ),
              children: <Widget>[
                //Container for 1.lydfil for kategori STOP OP
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text(soundFiles[3].title),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[3].imagepath),
                        ),
                        subtitle: Text(soundFiles[3].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PlaySong(
                                          soundFile: SoundFile(soundFiles[3].filepath, soundFiles[3].imagepath, soundFiles[3].title, soundFiles[3].description)
                                      )
                              )
                          );
                        }
                    )
                ),
                // Container for 2.lydfil til kategori STOP OP
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text("Stop OP2"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[3].imagepath),
                        ),
                        subtitle: Text(soundFiles[3].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaySong(
                                        soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
                                            "Stående afspænding \n" + "11:27 min") ),
                              )
                          );
                        }
                    )
                )
              ]
          ),
        ),
      ),
    );
  }

  Widget _cardSovGodt() {
    return new Card(
      color: Color.fromRGBO(241, 242, 245, 0.6),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Container(
          child: ExpansionTile(
              title: Text(soundFiles[4].title),
              leading: CircleAvatar(
                backgroundImage: AssetImage(soundFiles[4].imagepath),
              ),
              children: <Widget>[
                //Container for 1.lydfil for kategori SOV GODT
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text(soundFiles[4].title),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[4].imagepath),
                        ),
                        subtitle: Text(soundFiles[4].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PlaySong(
                                          soundFile: SoundFile(soundFiles[4].filepath, soundFiles[4].imagepath, soundFiles[4].title, soundFiles[4].description)
                                      )
                              )
                          );
                        }
                    )
                ),
                // Container for 2.lydfil til kategori SOV GODT
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: ListTile(
                        title: Text("Sov godt2"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(soundFiles[4].imagepath),
                        ),
                        subtitle: Text(soundFiles[4].description),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaySong(
                                        soundFile: SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
                                            "Stående afspænding \n" + "11:27 min") ),
                              )
                          );
                        }
                    )
                )
              ]
          ),
        ),
      ),
    );
  }

}

  List<SoundFile> soundFiles = [
    SoundFile('music/Godmorgen.mp3', 'assets/images/CupWhite.png', "Godmorgen",
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
