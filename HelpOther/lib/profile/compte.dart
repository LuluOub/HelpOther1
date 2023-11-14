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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [


              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( padding: EdgeInsets.only(top: 40),
                    child: Text('Votre Compte ', style: Theme.of(context).textTheme.titleLarge),),]
                  ),

              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),
              
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/user.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Pseudo :',style: Theme.of(context).textTheme.headlineLarge,),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('${user!.displayName}',style: Theme.of(context).textTheme.headlineLarge,),),

                ],
              ),


              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/Email.png',),width: 40,height: 40,color :Theme.of(context).iconTheme.color,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Email :',style: Theme.of(context).textTheme.headlineLarge,),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('${user!.email}',style:  Theme.of(context).textTheme.headlineLarge,),),

                ],
              ),
              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/Key.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Password :',style:  Theme.of(context).textTheme.headlineLarge,),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('*************',style:  Theme.of(context).textTheme.headlineLarge,),),

                ],
              ),
              Row(children: [
                Container( padding: EdgeInsets.only(left: 25,top: 1),
                  child: ElevatedButton( onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Mdpchange()));},
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.background,elevation: 0),
                  child: Text('changez votre mot de passe',style: Theme.of(context).textTheme.headlineMedium),),
                )
              ],),

              Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),

              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 25,top: 30),
                      child:Image( image: ExactAssetImage('images/stat.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
                  Container( padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text('Nombre de demande:',style: Theme.of(context).textTheme.headlineLarge,),),
                  Container( padding: EdgeInsets.only(left: 25,top: 35),
                    child: Text('10',style: Theme.of(context).textTheme.headlineLarge,),),

                ],
              ),



              Container(margin: EdgeInsets.only(bottom: 24,top: 30),
                height: 69,
                width: 159,
                 child : ElevatedButton(onPressed:() {
                   _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenWrapper()));
                    },
                    style: ElevatedButton.styleFrom(elevation: 3,
                      backgroundColor: Theme.of(context).buttonTheme.colorScheme!.background,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                        side:  BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 2), ),),
                    child:  Text("Se déconnecter",style: Theme.of(context).textTheme.labelLarge,),),
              ),

              Row(children: [
                Container( padding: EdgeInsets.only(left: 25,top: 20),
                  child: ElevatedButton( onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Mdpchange()));},
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.background,elevation: 0,side: BorderSide(color: Colors.red)),
                    child: Text('Supprimer votre compte',style:GoogleFonts.breeSerif(color: Colors.red,fontStyle: FontStyle.italic)),),
                )
              ],),
            ],
          ),

        ),
    );

  }
}
