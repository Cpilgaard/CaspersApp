import 'package:flutter/material.dart';
import 'DitUdbytte.dart';
import 'Profil.dart';
import 'ListSoundFiles.dart';
import 'package:rate_my_app/rate_my_app.dart';

RateMyApp _rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 0,
  minLaunches: 1,
  remindDays: 1,
  remindLaunches: 1,
);

class Forside extends StatefulWidget {
  static String tag = 'Forside';
  @override
  State<StatefulWidget> createState() {
    return ForsideState();
  }
}

// SingleTickerProviderStateMixin is used for animation
class ForsideState extends State<Forside> {
  @override
  void initState() {
    _rateMyApp.init().then((_) {
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

  double sizedWidth = 40.0;
  double sizedHeight = 40.0;
  double buttonHeight = 130.0;
  double buttonWidth = 130.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dit Pusterum"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dit Pusterum',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: sizedWidth,
              height: sizedHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CustomPaint(painter: Drawhorizontalline()),
                ),
                ButtonTheme(
                  minWidth: buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DitUdbytte.tag);
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0)),
                    child:
                        Text("Formål", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: sizedWidth,
                  height: sizedHeight,
                ),
                ButtonTheme(
                  minWidth: buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ListSoundFiles.tag);
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0)),
                    child: Text('Afspændings-\n' + 'sekvenser',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: sizedWidth,
              height: sizedHeight,
            ),
            ButtonTheme(
              minWidth: buttonWidth,
              height: buttonHeight,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Erfaringsgrundlag.tag);
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0)),
                child: Text('Erfarings-\n' + 'grundlag',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = Color.fromRGBO(42, 84, 133, 1)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(200, 0.0), Offset(30.0, 0.0), _paint); // Vandret
    _paint.color = Color.fromRGBO(61, 140, 183, 1);
    canvas.drawLine(Offset(250, 0.0), Offset(180, 140), _paint); // Højre Lodret
    _paint.color = Color.fromRGBO(117, 197, 227, 1);
    canvas.drawLine(Offset(123, 140), Offset(45, 0.0), _paint); //Venstre lodret
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
