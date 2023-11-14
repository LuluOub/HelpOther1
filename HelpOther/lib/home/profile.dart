
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:helpother/profile/Contact.dart';
import 'package:helpother/profile/Credit.dart';
import 'package:helpother/profile/Reglages.dart';
import 'package:helpother/profile/compte.dart';
import '../profile/Avis.dart';

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



     return Scaffold(

       backgroundColor: Theme.of(context).colorScheme.background,

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

         Container(padding: EdgeInsets.only(top: 20),child: Divider(color: Theme.of(context).colorScheme.secondary,endIndent: 50,indent: 50,thickness: 1,),),


         Row( mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container( width: 309, height: 59, margin: EdgeInsets.only(top: 30),
               child: ElevatedButton.icon(
                 icon: Padding(
                   padding: EdgeInsets.zero, // add padding to adjust icon
                   child:  Image(image: ExactAssetImage('images/user.png'),width: 30,height: 30,color: Theme.of(context).iconTheme.color),
                 ),
                 label: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Votre compte',style: Theme.of(context).textTheme.labelSmall),
                     Icon(Icons.arrow_forward_ios,color:Theme.of(context).iconTheme.color ,)
                   ],
                 ),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Compte()));
                   print('Button Pressed');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Theme.of(context).colorScheme.background,
                   foregroundColor: Theme.of(context).colorScheme.secondary,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background),
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
                   child:  Image(image: ExactAssetImage('images/settings.png'),width: 30,height: 30,color: Theme.of(context).iconTheme.color,),
                 ),
                 label: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Reglages',style: Theme.of(context).textTheme.labelSmall,),
                     Icon(Icons.arrow_forward_ios,color:Theme.of(context).iconTheme.color)
                   ],
                 ),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Reglages()));
                   print('Button Pressed');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Theme.of(context).colorScheme.background,
                   foregroundColor: Theme.of(context).colorScheme.secondary,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background),
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
                   child:  Image(image: ExactAssetImage('images/probleme.png'),width: 30,height: 30,color: Theme.of(context).iconTheme.color,),
                 ),
                 label: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Un problème ?',style: Theme.of(context).textTheme.labelSmall),
                     Icon(Icons.arrow_forward_ios,color: Theme.of(context).iconTheme.color,)
                   ],
                 ),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
                   print('Button Pressed');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Theme.of(context).colorScheme.background,
                   foregroundColor: Theme.of(context).colorScheme.secondary,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background),
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
                       child:  Image(image: ExactAssetImage('images/store.png'),width: 30,height: 30,color: Theme.of(context).iconTheme.color,),
                     ),
                     label: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Boutique',style: Theme.of(context).textTheme.labelSmall),
                         Icon(Icons.arrow_forward_ios,color:  Theme.of(context).iconTheme.color)
                       ],
                     ),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Credits()));
                       print('Button Pressed');
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Theme.of(context).colorScheme.background,
                       foregroundColor: Theme.of(context).colorScheme.secondary,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background),
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
                       child:  Image(image: ExactAssetImage('images/avis.png'),width: 30,height: 30,color: Theme.of(context).iconTheme.color),
                     ),
                     label: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Un avis ?',style: Theme.of(context).textTheme.labelSmall,),
                         Icon(Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color)
                       ],
                     ),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Avis()));
                       print('Button Pressed');
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Theme.of(context).colorScheme.background,
                       foregroundColor: Theme.of(context).colorScheme.secondary,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background),
                       ),
                     ),
                   ),
                 ),
               ],
             ),




       ],),),);
   }
 }