
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:helpother/profile/Contact.dart';
import 'package:helpother/profile/Credit.dart';
import 'package:helpother/profile/Reglages.dart';
import 'package:helpother/profile/compte.dart';
import '../profile/Avis.dart';

import '../services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


 class profile extends StatefulWidget {
   const profile({Key? key}) : super(key: key);

   @override
   State<profile> createState() => _profileState();
 }

 class _profileState extends State<profile> {
   firebase_auth.User? user;


   @override
   void initState() {
     super.initState();
     this.user = firebase_auth.FirebaseAuth.instance.currentUser;
   }

   @override
   Widget build(BuildContext context) {

     if (this.user == null) {
       this.user = firebase_auth.FirebaseAuth.instance.currentUser;
     }

     final AuthenticationService _auth = AuthenticationService();


     return Scaffold(

       backgroundColor: const Color(0xFFFCFFFC),

         body: SingleChildScrollView(
           child: Column( mainAxisAlignment: MainAxisAlignment.center,
           children: [

         Row( mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Container( padding: EdgeInsets.only(top: 100,bottom: 20),
         child:
         TextAvatar(
           shape: Shape.Circular,
           size: 155,
           textColor: Colors.white,
           fontSize: 60,
           fontWeight: FontWeight.bold,
           upperCase: true,
           backgroundColor: Colors.blue,
           numberLetters: 1,
           text: "${user!.displayName}",
              )
            )
          ]
         ),

         Container(padding: EdgeInsets.only(top: 20),child: Divider(color: Colors.black,endIndent: 50,indent: 50,thickness: 1,),),


         Row( mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container( width: 309, height: 59, margin: EdgeInsets.only(top: 30),
               child: ElevatedButton.icon(
                 icon: Padding(
                   padding: EdgeInsets.zero, // add padding to adjust icon
                   child:  Image(image: ExactAssetImage('images/user.png'),width: 30,height: 30,),
                 ),
                 label: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Votre compte',style: GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                     Icon(Icons.arrow_forward_ios)
                   ],
                 ),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Compte()));
                   print('Button Pressed');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                   foregroundColor: Colors.black,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Color(0xFF387CFF)),
                   ),
                 ),
               ),
             ),
           ],
         ),

             Row( mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container( width: 309, height: 59, margin: EdgeInsets.only(top: 20),
               child: ElevatedButton.icon(
                 icon: Padding(
                   padding: EdgeInsets.zero, // add padding to adjust icon
                   child:  Image(image: ExactAssetImage('images/settings.png'),width: 30,height: 30,),
                 ),
                 label: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Reglages',style: GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                     Icon(Icons.arrow_forward_ios)
                   ],
                 ),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Reglages()));
                   print('Button Pressed');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                   foregroundColor: Colors.black,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Color(0xFF387CFF)),
                   ),
                 ),
               ),
             ),
           ],
         ),

             Row( mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container( width: 309, height: 59, margin: EdgeInsets.only(top: 20),
               child: ElevatedButton.icon(
                 icon: Padding(
                   padding: EdgeInsets.zero, // add padding to adjust icon
                   child:  Image(image: ExactAssetImage('images/probleme.png'),width: 30,height: 30,),
                 ),
                 label: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Un problème ?',style: GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                     Icon(Icons.arrow_forward_ios)
                   ],
                 ),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
                   print('Button Pressed');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                   foregroundColor: Colors.black,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Color(0xFF387CFF)),
                   ),
                 ),
               ),
             ),
           ],
         ),
             Row( mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container( width: 309, height: 59, margin: EdgeInsets.only(top: 20),
                   child: ElevatedButton.icon(
                     icon: Padding(
                       padding: EdgeInsets.zero, // add padding to adjust icon
                       child:  Image(image: ExactAssetImage('images/credits.png'),width: 30,height: 30,),
                     ),
                     label: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Credits',style: GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                         Icon(Icons.arrow_forward_ios)
                       ],
                     ),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Credits()));
                       print('Button Pressed');
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.black,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color: Color(0xFF387CFF)),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
             Row( mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container( width: 309, height: 59, margin: EdgeInsets.only(top: 20),
                   child: ElevatedButton.icon(
                     icon: Padding(
                       padding: EdgeInsets.zero, // add padding to adjust icon
                       child:  Image(image: ExactAssetImage('images/avis.png'),width: 30,height: 30,),
                     ),
                     label: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Un avis ?',style: GoogleFonts.montserrat(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                         Icon(Icons.arrow_forward_ios)
                       ],
                     ),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Avis()));
                       print('Button Pressed');
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.black,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color: Color(0xFF387CFF)),
                       ),
                     ),
                   ),
                 ),
               ],
             ),




       ],),),);
   }
 }