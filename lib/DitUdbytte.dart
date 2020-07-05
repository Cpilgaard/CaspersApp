import 'package:flutter/material.dart';
import 'package:testpust/Profil.dart';

class DitUdbytte extends StatefulWidget {
  static String tag = 'Formål';
  @override
  State<StatefulWidget> createState() {
    return DitUdbytteState();
  }
}

class DitUdbytteState extends State<DitUdbytte> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formål"),
      ),
      body: new Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Baggrundtest.png'),
            fit: BoxFit.fill,
          )
      ),
        child: new SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //SizedBox(height: 55),
              Container(
                color: Color.fromRGBO(241, 242, 245, 0.6),
                child: RichText(
                  text: TextSpan(
                    // Gør overskriften til blå og større size end resten af teksten
                    text: "App'en " , style: TextStyle(color: Colors.blue, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: "henvender sig til alle voksne mennesker, som har lyst til at give sig selv og sin krop en pause fra hverdagens gøremål. Formålet er at have mulighed for at gå ”offline” og dermed lukke af for hverdagens larm, uanset hvor du befinder dig.\n\n" +
                          "App'en indeholder nogle lydfiler som har til hensigt at afspænde krop og sind. Størstedelen af afspændingssekvenserne er tiltænkt til bestemte tidspunkter på dagen, morgen, middag og aften, mens andre er mere velegnet til vilkårlige tidspunkter.\n\n" +
                          "Under en afspændingsøvelse er hippocampus, som er en del af hjernen og kroppens forsvar, med til at regulere og sænke niveauet af stresshormoner. Derved beroliges hjernen, så kroppen kan slappe af og give efter. I denne tilstand afbalanceres åndedrættet og immunforsvaret styrkes. Ved dagligt brug af øvelserne opnås den bedste effekt. Tænk på det som en mental fitness, der øger din mentale sundhed, ligesom regelmæssig fysisk træning opbygger og forbedrer din fysiske form.\n\n" +
                          "Nyeste anerkendte amerikanske studier viser at eksempelvis åndedrætsøvelser kan mindske stress, øge din opmærksomhed og sænke tankespind. Når du jævnligt udfører øvelserne kan du opleve at blive bedre til at være fokuseret og opmærksom, hvilket kan være med til at styrke din håndtering af en stresset og krævende arbejdsdag.  Ligeledes kan du opleve at der skal mere til at distrahere dig, da øvelserne træner din opmærksomhed og skærper dit nærvær i nuet.\n" +
                          "Afhængig af hvilken afspænding du vælger, så gør det så komfortabelt som muligt f.eks. ved brug af et tæppe, gode sko eller en blød stol.\n\n" +
                          "God fornøjelse!\n\n" +
                          "Kilder:\n" +
                          "Daniel Jay Goleman, videnskabsjournalist, psykolog & forfatter\n" +
                          "Richard Davidson, professer i psykologi og psykiatri ved University of Wisconsin-Madison\n" +
                          "Videnskab.dk \n", style: new TextStyle(color: Colors.black, fontSize: 16.0))
                  ]
                ),
              )
            ),
           ],
        ),
      ),
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
    //Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
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
    //Redirects to FACEBOOK
    icon: Icon(Icons.build, color: Color.fromRGBO(241, 242, 245, 0.6)),
    title: Text(''),
    ),
    new BottomNavigationBarItem(
    //Redirects to INSTAGRAM
    icon: Icon(Icons.title, color: Color.fromRGBO(241, 242, 245, 0.6)),
    title: new Text('')
    ),
    new BottomNavigationBarItem(
    // Redirects to Dit Udbytte / Formål
    icon: Icon(Icons.info, color: Color.fromRGBO(241, 242, 245, 0.6)),
    title: new Text(''),
    ),
    new BottomNavigationBarItem(
    //Redirects to Erfaringsgrundlag page
    icon: Icon(Icons.person, color: Color.fromRGBO(241, 242, 245, 0.6)),
    title: new Text(''),
    ),
    ],
    ),
    )
    );
  }
}
