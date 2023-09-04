import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:helpother/home/splashscreen_warpper.dart';
import '../services/authentication.dart';
import 'mdpchange.dart';




class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  firebase_auth.User? user;
  final AuthenticationService _auth = AuthenticationService();
  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }

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
                    child: Text('Votre Compte ', style: GoogleFonts.breeSerif(color: Color(0xFF323131),fontSize: 35),),
                  ),
                ],
              ),

              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Colors.black,thickness: 1,)),
              
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/user.png',),width: 40,height: 40,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Pseudo :',style: GoogleFonts.breeSerif(color:Color(0xFF323131),fontSize: 25),),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('${user!.displayName}',style: GoogleFonts.montserrat(color:Color(0xFF323131),fontSize: 15),),),

                ],
              ),


              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Colors.black,thickness: 1,)),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/Email.png',),width: 40,height: 40,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Email :',style: GoogleFonts.breeSerif(color:Color(0xFF323131),fontSize: 25),),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('${user!.email}',style: GoogleFonts.montserrat(color:Color(0xFF323131),fontSize: 15),),),

                ],
              ),
              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Colors.black,thickness: 1,)),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/Key.png',),width: 40,height: 40,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Password :',style: GoogleFonts.breeSerif(color:Color(0xFF323131),fontSize: 25),),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('*************',style: GoogleFonts.montserrat(color:Color(0xFF323131),fontSize: 15),),),

                ],
              ),
              Row(children: [
                Container( padding: EdgeInsets.only(left: 25,top: 1),
                  child: ElevatedButton( onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Mdpchange()));}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFCFFFC),elevation: 0),
                  child: Text('changez votre mot de passe',style:GoogleFonts.breeSerif(color: Colors.grey,fontStyle: FontStyle.italic)),),
                )
              ],),

              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Colors.black,thickness: 1,)),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/stat.png',),width: 40,height: 40,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Nombre de demande:',style: GoogleFonts.breeSerif(color:Color(0xFF323131),fontSize: 25),),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('10',style: GoogleFonts.montserrat(color:Color(0xFF323131),fontSize: 15),),),

                ],
              ),



              Container(padding: EdgeInsets.only(top: 20),
                child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
                  ElevatedButton(onPressed:() {_auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenWrapper()));
                    },
                    style: ElevatedButton.styleFrom(elevation: 3,
                      fixedSize: Size(159, 69),
                      backgroundColor:  Color(0xFF387CFF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                        side:  BorderSide(color: Color(0xFF387CFF),width: 2), ),),
                    child:  Text("Se déconnecter",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),),),
                ],),
              ),

              Row(children: [
                Container( padding: EdgeInsets.only(left: 25,top: 20),
                  child: ElevatedButton( onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Mdpchange()));},
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFCFFFC),elevation: 0,side: BorderSide(color: Colors.red)),
                    child: Text('Supprimer votre compte',style:GoogleFonts.breeSerif(color: Colors.red,fontStyle: FontStyle.italic)),),
                )
              ],),
            ],
          ),

        ),
    );

  }
}
