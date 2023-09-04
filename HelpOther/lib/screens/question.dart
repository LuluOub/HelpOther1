import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpother/Tuto/msgbvn.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {


  String error = '';
  bool checked = false;
  firebase_auth.User? user;


  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }







  String? selectedValue;
  String? selectedClasse;
  String? selectedMatiere;

  final List<String> items =[
    'Collège',
    'Lycée',
    'Lycée-Pro',
    'BUT',
    'BTS',
    'Prepa',
    'Etude supérieur',
  ];

  final List<String> classe =[
    '6ème',
    '5ème',
    '4ème',
    '3ème',
    '2nd',
    '1er',
    'Terminale',
  ];
  final List<String> matiere =[
    'Mathematique',
    'Physique-chimie',
    'Français',
    'Anglais',
    'SVT',
  ];



  @override
  Widget build(BuildContext context) {


    if (this.user == null) {
      this.user = firebase_auth.FirebaseAuth.instance.currentUser;
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [

                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container( padding: EdgeInsets.only(top: 60),width: 333,
                      child: Text('Avant de commencer on va te poser quelques questions !',
                        style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ), textAlign: TextAlign.center,
                    ),),
                  ],
                ),



            Container( padding: EdgeInsets.only(top: 10),child: Divider(color: Colors.black,thickness: 1,indent: 40,endIndent: 40,)),


            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container( padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Quel étude tu fait ?',
                style: GoogleFonts.breeSerif(
                color: Color(0xFF323131),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),)
            ],),



            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( alignment: Alignment.topLeft,padding: EdgeInsets.only(top: 20,bottom: 20), child :
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
                            'Selectionne tes études ',
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

            Container(child: Divider(color: Colors.black,endIndent: 100,indent: 100,thickness: 1,),),

            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Dans quelle classe est-tu ?',
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),)
              ],),


            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( alignment: Alignment.topLeft,padding: EdgeInsets.only(top: 20,bottom: 20), child :
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
                    items: classe
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
                    value: selectedClasse,
                    onChanged: (String? value) {
                      setState(() {
                        selectedClasse = value;
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


            Container(child: Divider(color: Colors.black,endIndent: 100,indent: 100,thickness: 1,),),

            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( width: 344,
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Dans quelle matière veux-tu de l’aide ?', textAlign: TextAlign.center,
                    style: GoogleFonts.breeSerif(
                      color: Color(0xFF323131),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),),)
              ],),

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
                            'Selectionne une matière ',
                            style: GoogleFonts.aBeeZee(color: Color(0xFF666666),fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: matiere
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
                    value: selectedMatiere,
                    onChanged: (String? value) {
                      setState(() {
                        selectedMatiere = value;
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

            Container(child: Divider(color: Colors.black,endIndent: 100,indent: 100,thickness: 1,),),

            Container(

              margin: EdgeInsets.only(bottom: 24,top: 10    ),
              width: 159,
              height: 69,
              child: ElevatedButton(

                onPressed: () {
                  FirebaseFirestore.instance.collection('demande').add({'matiere' : selectedMatiere.toString(),'Classe' : selectedClasse.toString(),'etude': selectedValue.toString()});
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BienvenueScreen()));},
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF387CFF),elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                child: Text(
                    "C'est Fait !",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bowlbyOneSc(color: Colors.white,fontSize: 16)
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}


