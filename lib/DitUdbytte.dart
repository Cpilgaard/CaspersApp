import 'package:flutter/material.dart';

class DitUdbytte extends StatefulWidget {
  static String tag = 'Formål';
  @override
  State<StatefulWidget> createState() {
    return DitUdbytteState();
  }
}

class DitUdbytteState extends State<DitUdbytte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formål"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new SingleChildScrollView(
                  child: new Text(
                    "App’en henvender sig til alle voksne mennesker, som har lyst til at give sig selv og sin krop en pause fra hverdagens gøremål. Formålet er at have mulighed for at gå ”offline” og dermed lukke af for hverdagens larm, uanset hvor du befinder dig.\n\n" +
                        "App'en indeholder nogle lydfiler som har til hensigt at afspænde krop og sind. Størstedelen af afspændingssekvenserne er tiltænkt til bestemte tidspunkter på dagen, morgen, middag og aften, mens andre er mere velegnet til vilkårlige tidspunkter.\n\n" +
                        "Under en afspændingsøvelse er hippocampus, som er en del af hjernen og kroppens forsvar, med til at regulere og sænke niveauet af stresshormoner. Derved beroliges hjernen, så kroppen kan slappe af og give efter. I denne tilstand afbalanceres åndedrættet og immunforsvaret styrkes. Ved dagligt brug af øvelserne opnås den bedste effekt. Tænk på det som en mental fitness, der øger din mentale sundhed, ligesom regelmæssig fysisk træning opbygger og forbedrer din fysiske form.\n\n" +
                        "Nyeste anerkendte amerikanske studier viser at eksempelvis åndedrætsøvelser kan mindske stress, øge din opmærksomhed og sænke tankespind. Når du jævnligt udfører øvelserne kan du opleve at blive bedre til at være fokuseret og opmærksom, hvilket kan være med til at styrke din håndtering af en stresset og krævende arbejdsdag.  Ligeledes kan du opleve at der skal mere til at distrahere dig, da øvelserne træner din opmærksomhed og skærper dit nærvær i nuet.\n" +
                        "Afhængig af hvilken afspænding du vælger, så gør det så komfortabelt som muligt f.eks. ved brug af et tæppe, gode sko eller en blød stol.\n\n" +
                        "God fornøjelse!\n\n" +
                        "Kilder:\n" +
                        "Daniel Jay Goleman, videnskabsjournalist, psykolog & forfatter\n" +
                        "Richard Davidson, professer i psykologi og psykiatri ved University of Wisconsin-Madison\n" +
                        "Videnskab.dk \n",
                    style: new TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
