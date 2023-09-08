import 'package:carousel_slider/carousel_slider.dart';
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

  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: const Color(0xFFFCFFFC),
        body : Container(
          child: ListView(
            children: [

              Container( width: 372, padding: EdgeInsets.only(top:60),

                child: Text('Content de te revoir ${user!.displayName} !',
                  style: GoogleFonts.breeSerif(
                    color: Color(0xFF323131),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ), textAlign: TextAlign.center,),
              ),
              Container(padding: EdgeInsets.only(top:20),child: Divider(color: Colors.black, endIndent: 50, indent: 50, thickness: 1,)),
              Row(
                children: [
                  Container( width: 372, padding: EdgeInsets.only(top: 30,right: 112),

                    child: Text('Les news de l’application :',
                      style: GoogleFonts.breeSerif(
                        color: Color(0xFF323131),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ), textAlign: TextAlign.center,),
                  ),
                ],
              ),



              CarouselSlider(items: [

                Container( margin: EdgeInsets.only(bottom: 40,top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Color(0xFF2541B2),width: 1),
                    image: const DecorationImage(scale: 1.5,
                        image: ExactAssetImage('images/tree.jpg'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40,top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Color(0xFF2541B2),width: 1),
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
              Container(padding: EdgeInsets.only(bottom: 10),child: Divider(color: Colors.black, endIndent: 50, indent: 50, thickness: 1,)),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( width: 323,
                    child: Text('Tu as (nb de reponse) en attente ! Tu devrais aller y répondre !',
                      style: GoogleFonts.breeSerif(
                        color: Color(0xFF323131),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ), textAlign: TextAlign.center,)
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
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2541B2),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                      child: Text(
                          "Allons-y !",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bowlbyOneSc(color: Colors.white,fontSize: 16)
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
