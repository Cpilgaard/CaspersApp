import 'package:flutter/material.dart';

class Erfaringsgrundlag extends StatefulWidget {
  static String tag = 'Erfaringsgrundlag';
  @override
  State<StatefulWidget> createState() {
    return ErfaringsgrundlagState();
  }
}

// SingleTickerProviderStateMixin is used for animation
class ErfaringsgrundlagState extends State<Erfaringsgrundlag> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Erfaringsgrundlag"),
      ),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: new Column(          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.asset('assets/images/MarleneNy.png'),
            new SizedBox(height: 20),
            Text(
              "Beskrivelse:",
              style: new TextStyle(fontSize: 26.0, color: Colors.blue),
            ),
            SizedBox(height: 5),
            Text(
              "Denne app tager udgangspunkt i min uddannelse som professions bachelor i afspændingspædagogik og psykomotorik. Afspændingssekvenserne er udarbejdet og inspireret ud fra min erfaring med undervisning inden for afspændingspædagogikken igennem de sidste 11 år.\n" +
                  "I disse år har jeg erhvervet mig en solid portion erfaring og viden omkring, hvad det vil sige at arbejde med mennesker, at opbygge relationer og samtidig være motiverende i den enkeltes udviklingsproces. " +
                  "Mine kerneydelser er individuelle samtaler med fokus på trivsel, udvikling og egne ressourcer. Samt teoretisk og praktisk gruppeundervisning i kropsbevidstheds-\n" + "træning, afspænding for krop og sind, meditation og stressforebyggelse.\n",
              style: new TextStyle(fontSize: 16.0),
            ),
            Text(
              "Kontaktoplysninger:",
              style: new TextStyle(fontSize: 26.0, color: Colors.blue),
            ),
            SizedBox(height: 5),
            Text(
              "Marlene Biegel \n" +
                  "Mail: biegel@mail.dk \n" +
                  "Tlf. 22226127 ",
              style: new TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

