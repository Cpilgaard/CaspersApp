import 'package:flutter/material.dart';
import 'package:testpust/FavoritPage.dart';
import 'package:testpust/Profil.dart';
import 'GodmorgenSoundPage.dart';

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
        actions: <Widget>[
          IconButton(
          icon: new Image.asset("assets/icons/heartFilledAppBar.png"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => FavoritPage()
              )
              );
            },
          )
        ],
          backgroundColor: Color.fromRGBO(48, 121, 169, 1.0 )
      ),
      body: new Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Baggrundtest.png'),
            fit: BoxFit.fill,
          )
      ),
          child: new Center(
            child: new Container(
              padding: EdgeInsets.all(20.0),
              color: Color.fromRGBO(241, 242, 245, 0.4),
              height: 425,
              width: 350,
              child: new Center(
                  child: SingleChildScrollView(
                    child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox(height: 55),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color.fromRGBO(241, 242, 245, 0.6),
                        child: RichText(
                          text: TextSpan(
                            // Gør overskriften til blå og større size end resten af teksten
                            text: "Dit Pusterum" , style: TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(text: "\nApp'en henvender sig til alle voksne mennesker, som har lyst til at give sig selv og sin krop en pause fra hverdagens gøremål. Formålet er at have mulighed for at gå ”offline” og dermed lukke af for hverdagens larm, uanset hvor du befinder dig.\n\n" +
                                  "App'en indeholder nogle lydfiler som har til hensigt at afspænde krop og sind. Størstedelen af afspændingssekvenserne er tiltænkt til bestemte tidspunkter på dagen, morgen, middag og aften, mens andre er mere velegnet til vilkårlige tidspunkter.\n\n" +
                                  "Under en afspændingsøvelse er hippocampus, som er en del af hjernen og kroppens forsvar, med til at regulere og sænke niveauet af stresshormoner. Derved beroliges hjernen, så kroppen kan slappe af og give efter. I denne tilstand afbalanceres åndedrættet og immunforsvaret styrkes. Ved dagligt brug af øvelserne opnås den bedste effekt. Tænk på det som en mental fitness, der øger din mentale sundhed, ligesom regelmæssig fysisk træning opbygger og forbedrer din fysiske form.\n\n" +
                                  "Nyeste anerkendte amerikanske studier viser at eksempelvis åndedrætsøvelser kan mindske stress, øge din opmærksomhed og sænke tankespind. Når du jævnligt udfører øvelserne kan du opleve at blive bedre til at være fokuseret og opmærksom, hvilket kan være med til at styrke din håndtering af en stresset og krævende arbejdsdag.  Ligeledes kan du opleve at der skal mere til at distrahere dig, da øvelserne træner din opmærksomhed og skærper dit nærvær i nuet.\n" +
                                  "Afhængig af hvilken afspænding du vælger, så gør det så komfortabelt som muligt f.eks. ved brug af et tæppe, gode sko eller en blød stol.\n\n" +
                                  "God fornøjelse!\n\n" +
                                  "Kilder:\n" +
                                  "Daniel Jay Goleman, videnskabsjournalist, psykolog & forfatter\n" +
                                  "Richard Davidson, professer i psykologi og psykiatri ved University of Wisconsin-Madison\n" +
                                  "Videnskab.dk \n", style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 14))
                          ]
                        ),
                      ),
            ),
           ],
        ),
      ),
    ),
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
  }
