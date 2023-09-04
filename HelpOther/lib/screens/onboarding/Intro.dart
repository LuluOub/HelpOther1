import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../register/authenticate.dart';


class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
final _controller = PageController();
bool isLastPage = false;

@override
void dispose(){
  _controller.dispose();

  super.dispose();
}

  @override
  Widget build(BuildContext context) => Scaffold(
      body : Container( color: const  Color(0xFFFCFFFC),
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == 2;
          });
        },
        controller: _controller,
        children: [
          SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ Container(
                        padding: EdgeInsets.only(top: 114),
                        child: Text('Bienvenue sur',
                          style: GoogleFonts.breeSerif(color: Color(0xFF323131), fontWeight: FontWeight.w400,fontSize: 48),
                        )
                    )
                    ],
                  ),
                ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack( alignment: Alignment.center,
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 30),
                          height: 250,
                          width: 305,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2,color: Color(0xFF387CFF)),
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(bottom: 30),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage('images/HelpOther.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 180),
                          child: Text(
                            'HelpOther',
                            style: GoogleFonts.concertOne(
                              color: Color(0xFF323131),
                              fontSize: 48,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Container(
                  width: 319,
                  padding: EdgeInsets.only(top: 40),
                  child: Text('Nous sommes très content de te voir !', textAlign: TextAlign.center,
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),),

                Container(
                  width: 319,
                  padding: EdgeInsets.only(top: 20),
                  child: Text('Je vais t’expliquer le fonctionnement !', textAlign: TextAlign.center,
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),),

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Container(
                  width: 340,
                  padding: EdgeInsets.only(top:100),
                  child: Text(
                    "Notre but c’est de vous aider dans ses différentes matières !",
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 254,
                            width: 297,
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2,color: Color(0xFF387CFF)),
                                  borderRadius: BorderRadius.circular(15),
                                )
                            ),
                          ),
                        ),


                        Column( mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 155),
                              width: 295,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFF387CFF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 150,
                          top: 32,
                          child:
                          Transform(
                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                            child: Container(
                              width: 250,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFF387CFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 40,left: 25),
                          width: 99,
                          height: 99,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/livre.png'),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40,left: 170),
                          width: 99,
                          height: 99,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/science.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 170,left: 25),
                          width: 99,
                          height: 99,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/traduire.png'),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 200,left: 170),
                          width: 99,
                          height: 99,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/More.png'),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17),),
                          ),
                        ),
                      ],
                    )

                  ],
                ),

                Container( padding: EdgeInsets.only(top:20),
                  child:
                  Text('Tout ça gratuitement ! ',
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),),

                Container( padding: EdgeInsets.only(top:20),
                  child:
                  Text('Juste en regardant des pubs !  ',
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),),


              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [



                Container( padding: EdgeInsets.only(top: 100),
                  child: Text(
                    'Les personnes qui vous aides sont comme vous des étudiants !',
              style: GoogleFonts.breeSerif(
                color: Color(0xFF323131),
                fontWeight: FontWeight.bold,
                fontSize: 35,
                       ),
              textAlign: TextAlign.center,
                    ),
                  ),
                Stack( children : [
                Container( margin: EdgeInsets.only(top: 50),
                  width: 373,
                  height: 161,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF387CFF)),
                      borderRadius: BorderRadius.circular(15),
                    ),),),


                  Container(
                    margin: EdgeInsets.only(top: 70,left: 10),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('images/etudiant.gif'),
                        fit: BoxFit.fill

                      ),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 70,left: 130),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('images/etudiant.gif'),
                          fit: BoxFit.fill

                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70,left: 250),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('images/etudiant.gif'),
                          fit: BoxFit.fill

                      ),
                    ),
                  ),
               ], ),
                Stack(children: [
                Row( mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('images/arrow2.png'),

                        ),
                      ),
                    ),
                  ],
                ),

                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container( width: 314,

                      margin: EdgeInsets.only(top: 50),
                      child: Text(
                        'L’argent des pubs sera reversé à l’étudiant !',
                        style: GoogleFonts.breeSerif(
                          color: Color(0xFF323131),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),


                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container( width: 314,

                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Alors tu as compris ?',
                        style: GoogleFonts.breeSerif(
                          color: Color(0xFF323131),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    ],
      )
      ),
    bottomSheet: isLastPage
    ? Container(color : const Color(0xFFFCFFFC),
      padding: EdgeInsets.symmetric(horizontal: 24), height: 100,
      child: Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            margin: EdgeInsets.only(bottom: 24),
            width: 159,
            height: 69,
            child: ElevatedButton(

              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticateScreen()));},
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF387CFF),elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
              child: Text(
                  "Je m'inscris !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bowlbyOneSc(color: Colors.white,fontSize: 16)
              ),
            ),
          ),
        ],),)



    : Container(color :  Color(0xFFFCFFFC),
       padding: EdgeInsets.symmetric(horizontal: 24), height: 80,
      child: Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: SmoothPageIndicator(controller: _controller, count: 3, effect: JumpingDotEffect(activeDotColor: Color(0xFF387CFF)),
          onDotClicked: (index) => _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
          ),),


        ],
      ),

    ),
    );
}

