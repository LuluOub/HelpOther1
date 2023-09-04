import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpother/Tuto/1e%20demande.dart';

class BienvenueScreen extends StatefulWidget {
  const BienvenueScreen({super.key});

  @override
  State<BienvenueScreen> createState() => _BievenueScreenState();
}

class _BievenueScreenState extends State<BienvenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Row(
              children: [
                Transform.rotate(angle: 102,child:
                Container( margin: EdgeInsets.only(left: 30),
                  width: 125,
                  height: 112,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('images/confetti.gif'),

                ),
              ),
            ),
                ),Transform.rotate(angle: 60,child:
                Container(alignment: Alignment.bottomRight, margin: EdgeInsets.only(right: 110),
                  width: 125,
                  height: 112,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('images/confetti.gif'),

                ),
              ),
            ),
                ),
              ],

            ),







            Container( padding: EdgeInsets.only(top: 150),
              child: Text("On te souhaite la Bienvenue !",style :GoogleFonts.breeSerif(
              color: Color(0xFF323131),
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
              textAlign: TextAlign.center,
            ),),
             Container( padding: EdgeInsets.only(top: 20),
              child: Text("Je vais t’aider pour ta première demande !",style :GoogleFonts.breeSerif(
              color: Color(0xFF323131),
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
              textAlign: TextAlign.center,
            ),),

            Container(

              margin: EdgeInsets.only(top: 70),
              width: 159,
              height: 69,
              child: ElevatedButton(

                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => premDemande()));},
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF387CFF),elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                child: Text(
                    "GOOO !",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bowlbyOneSc(color: Colors.white,fontSize: 16)
                ),
              ),
            ),
            Column( mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    Row( mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.rotate(angle: 94,child:
                        Container( margin: EdgeInsets.only(top:100,left: 20),
                          width: 125,
                          height: 112,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/confetti.gif'),

                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        Transform.rotate(angle: 5,child:
                        Container( margin: EdgeInsets.only(left:300,top:50,  ),
                          width: 125,
                          height: 112,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/confetti.gif'),

                            ),
                          ),
                        ),
                        ),
                      ],
                    ),



              ],
            ),






          ],
        ),
      ),

    );
  }
}
