

import 'package:checkmark/checkmark.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:helpother/common/pub.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


class Create extends StatefulWidget {


  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> with SingleTickerProviderStateMixin {

  firebase_auth.User? user;


  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }
  final _demandekey = GlobalKey<FormState>();
  String error = '';
  bool checked = false;





  TextEditingController textarea = TextEditingController();



  final chapitreController = TextEditingController();
  final problemeController = TextEditingController();



  void dispose() {

    chapitreController.dispose();
    problemeController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      _demandekey.currentState?.reset();
      error = '';
      chapitreController.text = '';
      problemeController.text = '';

    });


  }
   String? selectedJour;
   String? selectedValue;

  final List<String> items =[
    'Mathematique',
    'Physique-chimie',
    'Français',
    'Anglais',
    'SVT',
  ];

  final List<String> jour =[
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
  ];



  @override
  Widget build(BuildContext context) {
     return Scaffold( backgroundColor: const Color(0xFFFCFFFC),
      body: SingleChildScrollView( padding: EdgeInsets.only(left: 24, right: 24,), child : Column(
        children: [

          Container(padding: EdgeInsets.only(top: 25,) ,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(padding: EdgeInsets.only(top: 100), child: Text("Remplis ce formulaire pour qu'on puisse t'aider !", style: GoogleFonts.raleway(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25, ),textAlign: TextAlign.center,)),
          ],),),
          Container( color: Colors.white,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CheckMark(
                inactiveColor: Colors.white,
                activeColor: Colors.greenAccent,


                active: checked,
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 500),),),
          ),













          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( alignment: Alignment.topLeft,padding: EdgeInsets.only(bottom: 20), child :
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint:  Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Selectionne une matière ',
                          style: GoogleFonts.aBeeZee(color: Color(0xFF666666),fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Center(
                      child: Text(
                        item,
                        style : GoogleFonts.aBeeZee(color: Color(0xFF666666),fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 60,
                    width: 308,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Color(0xFF387CFF),
                      ),
                      color: Color(0xFFFCFFFC),
                    ),
                    elevation: 6,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                    iconSize: 20,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.black,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 308,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                        color: Color(0xFFFCFFFC),
                        border: Border.all(color: Color(0xFF387CFF))
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),),
              ), ],
          ),


         Row( mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container( alignment: Alignment.topLeft,padding: EdgeInsets.only(top:20,bottom: 20), child :
             DropdownButtonHideUnderline(
               child: DropdownButton2<String>(
                 isExpanded: true,
                 hint:  Row(
                   children: [
                     SizedBox(
                       width: 4,
                     ),
                     Expanded(
                       child: Text(
                         'Selectionne ta classe ',
                         style: GoogleFonts.aBeeZee(color: Color(0xFF666666),fontSize: 15),
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                   ],
                 ),
                 items: jour
                     .map((String item) => DropdownMenuItem<String>(
                   value: item,
                   child: Center(
                     child: Text(
                       item,
                       style : GoogleFonts.aBeeZee(color: Color(0xFF666666),fontSize: 15),
                       textAlign: TextAlign.center,
                       overflow: TextOverflow.ellipsis,

                     ),
                   ),
                 ))
                     .toList(),
                 value: selectedJour,
                 onChanged: (String? value) {
                   setState(() {
                     selectedJour = value;
                   });
                 },
                 buttonStyleData: ButtonStyleData(
                   height: 60,
                   width: 308,
                   padding: const EdgeInsets.only(left: 14, right: 14),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(14),
                     border: Border.all(
                       color: Color(0xFF387CFF),
                     ),
                     color: Color(0xFFFCFFFC),
                   ),
                   elevation: 6,
                 ),
                 iconStyleData: IconStyleData(
                   icon: Icon(
                     Icons.keyboard_arrow_down_outlined,
                   ),
                   iconSize: 20,
                   iconEnabledColor: Colors.black,
                   iconDisabledColor: Colors.black,
                 ),
                 dropdownStyleData: DropdownStyleData(
                   maxHeight: 200,
                   width: 308,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(14),
                     color: Color(0xFFFCFFFC),
                     border: Border.all(color: Color(0xFF387CFF))
                   ),
                   scrollbarTheme: ScrollbarThemeData(
                     radius: const Radius.circular(40),
                     thickness: MaterialStateProperty.all<double>(5),
                     thumbVisibility: MaterialStateProperty.all<bool>(true),
                   ),
                 ),
                 menuItemStyleData: const MenuItemStyleData(
                   height: 40,
                   padding: EdgeInsets.only(left: 14, right: 14),
                 ),
               ),),
             ), ],
         ),

          Column(children: [
            Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Form(
                    key: _demandekey,

                    child: Column(
                      children: [

                        Container( height: 77,width: 308,
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            minLines: 1,
                            maxLines: 5,




                            style: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),
                            controller: chapitreController,
                            decoration: InputDecoration(
                              hintText: 'Quel est le chapitre ? ',
                              prefixIcon:   Padding(
                                padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                                child:  Image(image: ExactAssetImage('images/question.png'),width: 40,height: 30,),
                              ),

                              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF387CFF),width: 1),),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF387CFF), width: 1,),),
                              hintStyle: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),),
                            validator: (value) => value != null && value.length < 10
                                ? "Rentre un chapitre pour qu'on puisse bien t'eguiller "
                                : null,
                          ),
                        ),
                 ],  ),
                )
            ),


                    Column(
                      children: [

                        Container( height: 77,width: 308,
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            minLines: 1,
                            maxLines: 5,




                            style: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),
                            controller: problemeController,
                            decoration: InputDecoration(
                              hintText: 'Decris nous ton problème ? ',
                              prefixIcon:   Padding(
                                padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                                child:  Image(image: ExactAssetImage('images/question.png'),width: 40,height: 30,),
                              ),

                              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF387CFF),width: 1),),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF387CFF), width: 1,),),
                              hintStyle: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),),
                            validator: (value) => value != null && value.length < 25
                                ? "Decris nous un peu plus ton problème ( le plus de détails possibles ) !"
                                : null,
                          ),
                        ),
                      ],  ),
                  ],
          ),

          Container(margin: EdgeInsets.only(top: 50),height: 50,width: 260,child: ElevatedButton(onPressed: () async {
                    if (_demandekey.currentState?.validate() == true) {


                      FirebaseFirestore.instance.collection('demande').doc(user!.uid).set({
                        'name': user!.displayName,
                        'email': user!.email,
                        'uid': user!.uid,
                        'chapitre': chapitreController.text,'demande' : problemeController.text,'jour' : selectedJour.toString(),'Matière' : selectedValue.toString(),});
                      problemeController.clear();
                      chapitreController.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Pub()));

                    setState(() {
                      checked = !checked;
                    });


                    dynamic result;
                    if (result == false) {
                    setState(() {
                    error = 'Rentrez une adresse valide !';});}}

          },
            style: ElevatedButton.styleFrom(elevation: 3,
              fixedSize: Size(159, 69),
              backgroundColor:  Color(0xFF387CFF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                side:  BorderSide(color: Color(0xFF387CFF),width: 2), ),),
            child:  Text("Envoyer ! ",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),),),),

       ],),),


     );





  }
  
  void onAdLoaded(InterstitialAd ad) {
  }
}




