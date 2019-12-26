import 'soundfile.dart';
import 'PlaySong.dart';
import 'package:flutter/material.dart';

class ListSoundFiles extends StatelessWidget {
  static String tag = 'ListSound';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Afspændingssekvenser')),
      body: BodyWidget(),
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
  SoundFile("music/SovgodtV1.1.mp3", "assets/images/SleepingWhite.png", "Sov godt",
      "Liggende afspænding \n" + "12:16 min"),
];

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
}
