import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
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
                  child: Text('Nos Crédits :', style: GoogleFonts.breeSerif(color: Color(0xFF323131),fontSize: 35),),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Colors.black,thickness: 1,)),





            Row(
              children: [
                Container( padding: EdgeInsets.only(top: 40,left: 50),
                  child: Text('- Lucas Oubaiche', style: GoogleFonts.breeSerif(color: Color(0xFF323131),fontSize: 25),),
                ),
              ],
            ),
            Row(
              children: [
                Container( padding: EdgeInsets.only(top: 40,left: 50),
                  child: Text('Et voila..', style: GoogleFonts.breeSerif(color: Color(0xFF323131),fontSize: 25),),
                ),
              ],
            ),






          ],
        ),
      ),
    );
  }
}
