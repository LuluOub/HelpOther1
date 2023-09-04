
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reglages extends StatefulWidget {
  const Reglages({super.key});

  @override
  State<Reglages> createState() => _ReglagesState();
}

class _ReglagesState extends State<Reglages> {

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFFCFFFC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFFFC),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [



            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( padding: EdgeInsets.only(top: 40),
                  child: Text('Votre Compte ', style: GoogleFonts.breeSerif(color: Color(0xFF323131),fontSize: 35),),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Colors.black,thickness: 1,)),


            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 25,top: 30),
                    child:Image( image: ExactAssetImage('images/notification.png',),width: 40,height: 40,)),
                Container( padding: EdgeInsets.only(left: 25,top: 30),
                  child: Text('Notification : ',style: GoogleFonts.breeSerif(color:Color(0xFF323131),fontSize: 25),),),
                Container( width: 100, padding: EdgeInsets.only(top: 30),
                  child: CheckboxListTile(
                      value: checkboxValue1,
                      onChanged: (bool? value) {
                        setState(()  {
                          checkboxValue1 = value!;
                          print('check1: $checkboxValue2');

                        });
                 }),

                ),
              ],
            ),


            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Colors.black,thickness: 1,)),


            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 25,top: 30),
                    child:Image( image: ExactAssetImage('images/anonyme.png',),width: 40,height: 40,)),
                Container( padding: EdgeInsets.only(left: 25,top: 30),
                  child: Text('Compte privée : ',style: GoogleFonts.breeSerif(color:Color(0xFF323131),fontSize: 25),),),
                Container( width: 100, padding: EdgeInsets.only(top: 30),
                  child: CheckboxListTile(
                      value: checkboxValue2,
                      onChanged: (bool? value) {
                        setState(()  {
                          checkboxValue2 = value!;
                          print('check2: $checkboxValue2');
                        });
                      }),

                ),
              ],
            ),

            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Colors.black,thickness: 1,)),

          ],
        ),
      ),


    );
  }
}
