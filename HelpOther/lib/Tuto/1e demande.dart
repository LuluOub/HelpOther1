import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpother/Tuto/Notification.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../home/BottomNavBar.dart';

class premDemande extends StatefulWidget {
  const premDemande({super.key});

  @override
  State<premDemande> createState() => _premDemandeState();
}

class _premDemandeState extends State<premDemande> {


  firebase_auth.User? user;
  final _demandekey = GlobalKey<FormState>();
  final List<String> matiere =[
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
  String? selectedMatiere;
  String? selectedJour;

  final chapitrecontroller = TextEditingController();
  final problemecontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( width: 350, padding: EdgeInsets.only(top: 100),
                  child: Text("Pour débuter remplis ses cases pour nous aider sur comment t’aider !", style:
        GoogleFonts.breeSerif(
          color: Color(0xFF323131),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
          textAlign: TextAlign.center,
        ),),
              ],
            ),



            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( alignment: Alignment.topLeft,padding: EdgeInsets.only(top:20,bottom: 20),margin: EdgeInsets.only(top: 30), child :
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
                            'Selectionne ta matiere ',
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

            Divider(color: Colors.black, endIndent: 50,indent: 50,thickness: 1,),

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
                            'Selectionne le jour ',
                            style: Theme.of(context).textTheme.labelMedium,
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
                          style :  Theme.of(context).textTheme.labelMedium,
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
                          color: Theme.of(context).buttonTheme.colorScheme!.background,
                        ),
                        color:Theme.of(context).colorScheme.background,
                      ),
                      elevation: 6,
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      iconSize: 20,
                      iconEnabledColor: Theme.of(context).iconTheme.color,
                      iconDisabledColor: Theme.of(context).iconTheme.color,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 308,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(color: Theme.of(context).buttonTheme.colorScheme!.background)
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

            Divider(color: Colors.black, endIndent: 50,indent: 50,thickness: 1,),


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
                          'Selectionne le jour ',
                          style: Theme.of(context).textTheme.labelMedium,
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
                        style :  Theme.of(context).textTheme.labelMedium,
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
                        color: Theme.of(context).buttonTheme.colorScheme!.background,
                      ),
                      color:Theme.of(context).colorScheme.background,
                    ),
                    elevation: 6,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                    iconSize: 20,
                    iconEnabledColor: Theme.of(context).iconTheme.color,
                    iconDisabledColor: Theme.of(context).iconTheme.color,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 308,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).colorScheme.background,
                        border: Border.all(color: Theme.of(context).buttonTheme.colorScheme!.background)
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
                  padding: EdgeInsets.only(top: 20),
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
                            controller: chapitrecontroller,
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

              Container(padding: EdgeInsets.only(bottom: 20),child: Divider(color: Colors.black, endIndent: 50,indent: 50,thickness: 1,)),

              Column(
                children: [

                  Container( height: 77,width: 308,
                    child: TextFormField(
                      cursorColor: Colors.blueAccent,
                      minLines: 1,
                      maxLines: 5,




                      style: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),
                      controller: problemecontroler,
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
            Container(

              margin: EdgeInsets.only(bottom: 24,top: 20    ),
              width: 159,
              height: 69,
              child: ElevatedButton(

                onPressed: () async {
                  FirebaseFirestore.instance.collection('demande').doc(user!.uid).set({
                    'name': user!.displayName,
                    'email': user!.email,
                    'uid': user!.uid,
                    'chapitre': chapitrecontroller.text,
                    'demande' : problemecontroler.text,'jour' : selectedJour.toString(),'Matière' : selectedMatiere.toString(),});
                  problemecontroler.clear();
                  chapitrecontroller.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));},
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF387CFF),elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                child: Text(
                    "C'est Fait !",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bowlbyOneSc(color: Colors.white,fontSize: 16)
                ),
              ),
            ),



            Row( mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container( padding: EdgeInsets.only(right: 20,top: 20),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent,
                      shape: StadiumBorder()),
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => menu())); },
                    child: Text('Passer pour l’instant', style: GoogleFonts.breeSerif(color: Colors.black,fontSize: 15),) ),
                ),
              ],
            ),

          ],
        ),
      ),




    );

  }
}
