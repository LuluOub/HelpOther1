import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/firebase_api.dart';
import '../home/BottomNavBar.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: SingleChildScrollView(
        child: Column(
          children: [

            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( width: 370, padding: EdgeInsets.only(top: 150),
                  child: Text('Avant tout pour pouvoir te contacter !',style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),),
              ],
            ),


            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( width: 370, padding: EdgeInsets.only(top: 20),
                  child: Text('N’oublie pas d’activer les notifications !',
                    style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,),),
              ],
            ),



                Container( padding: EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 239, height: 181, margin: EdgeInsets.only(top: 50),decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                    ),),),
                        ],
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container( margin: EdgeInsets.only(top: 80), width: 231,
                            child: Text('Veux tu recevoir les notifications ?',style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,)
                            ),
                        ],
                      ),




                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 180,left: 87),
                            width: 118,
                            height: 50,
                            child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor:Color(0xFF8FF7A7),elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9) ),),),
                              onPressed: () async { await FirebaseApi().initNotifications(); }, child: Text('Accepter',style: GoogleFonts.breeSerif(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ), textAlign: TextAlign.center),

                            ),
                          )
                        ],
                      ),







                      Row( mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container( margin: EdgeInsets.only(top: 180,right: 87),
                            width: 118,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE01C15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(9)),
                              ),
                            ),
                          ),
                        ],
                      ),



                      Row( mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container( margin: EdgeInsets.only(top: 194,right: 120),
                            child: Text('Refuser',style: GoogleFonts.breeSerif(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ), textAlign: TextAlign.center),


                          ),


                        ],
                      ),


                      Container( margin: EdgeInsets.only(top:180,left: 206),
                        child: Transform(
                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                          child: Container(
                            width: 50,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.5,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),




                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container( margin: EdgeInsets.only(top: 180),
                            width: 239,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )



                    ]
                  ),
                ),



            Container(

              margin: EdgeInsets.only(bottom: 24,top: 50    ),
              width: 159,
              height: 69,
              child: ElevatedButton(

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => menu()));},
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary,elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                child: Text(
                    "C'est Fait !!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge
                ),
              ),
            ),





          ],
        ),
      ),




    );
  }
}
