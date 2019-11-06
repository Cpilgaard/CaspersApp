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
  SoundFile("music/Test.mp3", "assets/images/Cup.png", "Godmorgen", "Siddende afspænding (6:12 min)"),
  SoundFile("music/Test2.mp3", "assets/images/Stop.png", "Stop op", "Siddende afspænding (10:56 min)"),
  SoundFile("music/Test3.mp3", "assets/images/Walking.png", "Frokostpausen", "Gående afspænding (5:21 min)"),
  SoundFile("music/Test3.mp3", "assets/images/Cloud-Bubble.png", "Dagens pusterum", "Liggende afspænding (15:24 min)"),
  SoundFile("music/Test3.mp3", "assets/images/Sleeping.png", "Sov godt", "Liggende afspænding (21:09 min)")
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
            title: Text(soundFiles[index].title, style: TextStyle(fontSize: 20)),   
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
