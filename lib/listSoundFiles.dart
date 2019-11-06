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
  SoundFile("music/Godmorgen.mp3", "assets/images/Cup.png", "Godmorgen",
      "Stående afspænding (11:27 min)"),
  SoundFile("music/Frokostpausen.mp3", "assets/images/Walking.png",
      "Frokostpausen", "Gående afspænding (10:52 min)"),
  SoundFile("music/DagensPusterum.mp3", "assets/images/Cloud-Bubble.png",
      "Dagens pusterum", "Siddende afspænding (9:11 min)"),
  SoundFile("music/StopOp.mp3", "assets/images/Stop.png", "Stop op",
      "Liggende afspænding (12:11 min)"),
  SoundFile("music/Sovgodt.mp3", "assets/images/Sleeping.png", "Sov godt",
      "Liggende afspænding (12:16 min)"),
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
