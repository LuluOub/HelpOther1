import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Avis extends StatefulWidget {
  const Avis({super.key});

  @override
  State<Avis> createState() => _AvisState();
}

class _AvisState extends State<Avis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text('Donnez votre avis ! ', style: GoogleFonts.breeSerif(color: Color(0xFF323131),fontSize: 35),),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Colors.black,thickness: 1,)),


            Container(padding: EdgeInsets.only(top: 50),
              child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
                ElevatedButton(onPressed:() {},
                  style: ElevatedButton.styleFrom(elevation: 3,
                    fixedSize: Size(159, 69),
                    backgroundColor:  Color(0xFF2541B2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                      side:  BorderSide(color: Color(0xFF2541B2),width: 2), ),),
                  child:  Text("IOS !",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),),),
              ],),
            ),
            Container(padding: EdgeInsets.only(top: 50),
              child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
                ElevatedButton(onPressed:() {},
                  style: ElevatedButton.styleFrom(elevation: 3,
                    fixedSize: Size(159, 69),
                    backgroundColor:  Color(0xFF2541B2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                      side:  BorderSide(color: Color(0xFF2541B2),width: 2), ),),
                  child:  Text("Android !",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),),),
              ],),
            ),



          ],
        ),
      ),
    );
  }
}
