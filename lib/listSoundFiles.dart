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
      ),
      body: _buildListSoundFiles(),
    );
  }
  
  Widget _buildListSoundFiles() {
    return new ListView.builder(
      itemCount: soundFiles.length,
      itemBuilder: (context, index) {
        return ListTile (
          leading: CircleAvatar(
            backgroundImage: AssetImage(soundFiles[index].imagepath),
          ),
          title:
          Text(soundFiles[index].title, style: TextStyle(fontSize: 20)),
          subtitle: Text(soundFiles[index].description),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaySong(soundFile: soundFiles[index]),
              ),
            );
          },
        );
      },
    );
  }
}



List<SoundFile> soundFiles = [
  SoundFile("music/Godmorgen.mp3", "assets/images/CupWhite.png", "Godmorgen",
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





/*class ListSoundFiles extends StatelessWidget {
  static String tag = 'ListSound';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Afspændingssekvenser')),
      body: BodyWidget(),
    );
  }
}


class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
        itemCount: soundFiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(soundFiles[index].imagepath),
            ),
            title:
            Text(soundFiles[index].title, style: TextStyle(fontSize: 20)),
            subtitle: Text(soundFiles[index].description),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaySong(soundFile: soundFiles[index]),
                ),
              );
            },
          );
        }));
  }


  List<SoundFile> soundFiles = [
    SoundFile("music/Godmorgen.mp3", "assets/images/CupWhite.png", "Godmorgen",
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
}*/
