
import 'soundfile.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testpust/DitUdbytte.dart';
import 'package:testpust/Profil.dart';
import 'FavoritPage.dart';
import 'dart:async';
import 'DatabaseHelper.dart';

class PlaySong extends StatefulWidget {
  PlaySong({Key key, this.soundFile}) : super(key: key);

  final SoundFile soundFile;

  @override
  _PlaySongState createState() => _PlaySongState(soundFile: this.soundFile);
}

class _PlaySongState extends State<PlaySong> {
  _PlaySongState({this.soundFile});
  SoundFile soundFile;
  AudioPlayer audioPlayer;
  Duration duration;
  Duration position;
  bool isPlaying = false;
  SharedPreferences prefs;
  DatabaseHelper helper = DatabaseHelper();


  AudioCache audioCache;

  get durationText =>
      duration != null ? (duration).toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  @override
  initState() {
    super.initState();

    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    setupPref();
    play();

    audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          position = p;
          prefs.setInt(soundFile.title, position.inSeconds);
          if (duration.inSeconds == position.inSeconds) {
            setState(() {
              position = new Duration(seconds: 0);
              pause();
            });
            audioPlayer.seek(position);
          }
        });
  }

  Future setupPref() async {
    prefs = await SharedPreferences.getInstance();
    int pos = prefs.getInt(soundFile.title) ?? 0;
    setState(() {
      position = new Duration(seconds: pos);
    });
    audioPlayer.seek(position);
  }

  Future play() async {
    audioPlayer = await audioCache.play(soundFile.filepath);
    setState(() {
      isPlaying = true;
    });
  }

  Future resume() async {
    audioPlayer.resume();
    setState(() {
      isPlaying = true;
    });
  }

  Future pause() async {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void positionChanged(double value) {
    audioPlayer.seek(new Duration(milliseconds: value.toInt()));
    setState(() {
      position = new Duration(milliseconds: value.toInt());
    });
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Widget _buildPlayer() =>
        new Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BaggrundNY.png'),
              fit: BoxFit.fill,
            )
        ),
            //padding: new EdgeInsets.all(100.0),
            child: new Center(
                child: new Container(
                    padding: EdgeInsets.all(5.0),
                    color: Color.fromRGBO(241, 242, 245, 0.4),
                    height: 400,
                    width: 350,
                    child: new Center(
                        child: new Container(
                          padding: EdgeInsets.all(5.0),
                          color: Color.fromRGBO(241, 242, 245, 0.4),
                          height: 325,
                          width: 325,
                            child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              new CircleAvatar(backgroundImage: AssetImage(soundFile.imagepath),
                              radius: 30,),
                              new Text(
                                soundFile.title,
                                style: new TextStyle(fontSize: 24.0, color: Color.fromRGBO(46, 91, 140, 1)),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                              ),
                              new IconButton(
                                onPressed: isPlaying ? () => pause() : () => resume(),
                                iconSize: 50.0,
                                icon: new Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                                color: Color.fromRGBO(46, 91, 140, 1), //Theme.of(context).buttonColor,
                              ),
                              duration == null
                                  ? new Container()
                                  : new Slider(
                                      value: position?.inMilliseconds?.toDouble() ?? 0,
                                      activeColor: Color.fromRGBO(46, 91, 140, 1),
                                      onChanged: (double value) => positionChanged(value),
                                      min: 0.0,
                                      max: duration.inMilliseconds.toDouble() + 1000),
                              new Row(mainAxisSize: MainAxisSize.min, children: [
                                new Text(
                                    position != null
                                        ? "${positionText ?? ''} / ${durationText ?? ''}"
                                        : duration != null ? durationText : '',
                                    // ignore: conflicting_dart_import
                                    style: new TextStyle(fontSize: 24.0, color: Color.fromRGBO(46, 91, 140, 1)))
                              ])
                            ]
                            ),
                          )
                      )
                  )
            )
        );

    int _currentIndex = 0;
    return new Scaffold(
        appBar: AppBar(
            title: Text(soundFile.title),
            actions: <Widget>[
              IconButton(
                icon: new Image.asset("assets/icons/heartFilledAppBar.png"),
                onPressed: () {
                  pause();
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => FavoritPage()
                  )
                  );
                },
              )
            ],
            backgroundColor: Color.fromRGBO(48, 121, 169, 1.0)
        ),
        body: new Container(child: _buildPlayer(),
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
                pause();
                break;
                case 1:
                  //TODO Redirect to Instagram
                pause();
                break;
                case 2:
                  // Redirects to Dit Udbytte / Formål
                pause();
                Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
                break;
                case 3:
                  // Redirects to Erfaringsgrundlag
                pause();
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
        ),
      // The following code lets the user add the playing song to favourits, if it already is not added.
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 270, bottom: 350),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  {
                    _saveSoundfile(this.soundFile, context);

                  }
                });
              },
            child: Image.asset("assets/icons/heartUnfilled.png"),
            backgroundColor: Color.fromRGBO(241, 242, 245, 0.2),
            elevation: 0,

             // icon: new Image.asset("assets/icons/heartUnfilled.png"),
              //label: Text("")
          ),
        ),
      ),
    );
  }

  void _saveSoundfile(soundfile, context) async {

    var result = helper.soundFileTable;
    if(!result.contains(soundfile)) {
      await helper.insertSoundfile(this.soundFile);
      showDialog(context: context,
          builder: (context){
            Future.delayed(Duration(milliseconds: 1200), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
                title: Text("Tilføjet til favoritter")
            );
          });
    } // TODO tilføj tekst der siger, at den er tilføjet
  }


}
