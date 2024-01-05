import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:helpother/home/Discussion.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  firebase_auth.User? user;



  void getdata() async{
    var vari = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();

    setState (() {
      print(vari.data()!['helpcoin']);
      helpcoin = vari.data()!['helpcoin'];
    });
  }
  var helpcoin;
  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
    getdata();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(actions:[ Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(margin: EdgeInsets.only(left: 10),child: Image.asset('images/helpcoin.png',width: 100,)),
            Container(child: Text("$helpcoin",style: Theme.of(context).textTheme.labelLarge,)),
          ],
        ),],elevation: 0, backgroundColor: Theme.of(context).colorScheme.background,),
        body : Container(
          child: ListView(
            children: [

              Container( width: 372, padding: EdgeInsets.only(top:40),

                child: Text('Content de te revoir ${user!.displayName} !',
                  style:Theme.of(context).textTheme.titleLarge,  textAlign: TextAlign.center,),
              ),
              Container(padding: EdgeInsets.only(top:20),child: Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 50, indent: 50, thickness: 1,)),
              Row(
                children: [
                  Container( width: 372, padding: EdgeInsets.only(top: 30,right: 112),

                    child: Text('Les news de l’application :',
                      style: Theme.of(context).textTheme.titleSmall ,textAlign: TextAlign.center,),
                  ),
                ],
              ),



              CarouselSlider(items: [

                Container( margin: EdgeInsets.only(bottom: 40,top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 1),
                    image:  const DecorationImage(scale: 1.5,
                        image: ExactAssetImage('images/tree.jpg'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40,top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 1),
                    image: const DecorationImage(scale: 1.5,
                        image: ExactAssetImage('images/elephant.jpg'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),

              ],


                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 12),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,

                ),
              ),
              Container(padding: EdgeInsets.only(bottom: 10),child: Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 50, indent: 50, thickness: 1,)),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( width: 323,
                    child: Text('Tu as (nb de reponse) en attente ! Tu devrais aller y répondre !',
                      style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,)
                    ,),
                ],
              ),

              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(bottom: 24,top: 30    ),
                    width: 159,
                    height: 69,
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Discussion()));},
                      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).buttonTheme.colorScheme!.background,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                      child: Text(
                          "Allons-y !",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
        )

    );

  }
}


