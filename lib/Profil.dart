import 'package:flutter/material.dart';
import 'package:testpust/FavoritPage.dart';
import 'GodmorgenSoundPage.dart';
import 'DitUdbytte.dart';

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
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Erfaringsgrundlag"),
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
                      Container(
                      padding: EdgeInsets.all(5),
                      color: Color.fromRGBO(241, 242, 245, 0.6),
                        child: new Image.asset('assets/images/MarleneNy.png', height: 300, width: 350,),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Color.fromRGBO(241, 242, 245, 0.6),
                        child: RichText(
                          text: TextSpan(
                            // Gør overskriften til blå og større size end resten af teksten
                              text: "Beskrivelse" , style: TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(text: "\nDenne app tager udgangspunkt i min uddannelse som professions bachelor i afspændingspædagogik og psykomotorik. Afspændingssekvenserne er udarbejdet og inspireret ud fra min erfaring med undervisning inden for afspændingspædagogikken igennem de sidste 11 år.\n" +
                                    "I disse år har jeg erhvervet mig en solid portion erfaring og viden omkring, hvad det vil sige at arbejde med mennesker, at opbygge relationer og samtidig være motiverende i den enkeltes udviklingsproces. " +
                                    "Mine kerneydelser er individuelle samtaler med fokus på trivsel, udvikling og egne ressourcer. Samt teoretisk og praktisk gruppeundervisning i kropsbevidstheds-\n" + "træning, afspænding for krop og sind, meditation og stressforebyggelse.\n",
                                    style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 14)),
                                TextSpan(text: "\nKontaktoplysninger: \n" , style: TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 20),),
                                TextSpan(text: "Marlene Biegel \n" + "Mail: biegel@mail.dk \n" + "Tlf. nr: 22226127",
                                    style: new TextStyle(color: Color.fromRGBO(46, 91, 140, 1), fontSize: 14))
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => DitUdbytte()));
                  break;
                case 3:
                // Redirects to Erfaringsgrundlag
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Erfaringsgrundlag()));
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


