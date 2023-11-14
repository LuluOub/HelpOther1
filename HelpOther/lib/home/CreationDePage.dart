import 'package:checkmark/checkmark.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
     return Scaffold( backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView( padding: EdgeInsets.only(left: 24, right: 24,), child : Column(
        children: [

          Container(padding: EdgeInsets.only(top: 25,) ,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(padding: EdgeInsets.only(top: 100), child: Text("Remplis ce formulaire pour qu'on puisse t'aider !", style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,)),
          ],),),
          Container( color: Theme.of(context).colorScheme.background,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CheckMark(
                inactiveColor: Theme.of(context).colorScheme.background,
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
                          style: Theme.of(context).textTheme.labelMedium,
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
                        style : Theme.of(context).textTheme.labelMedium,
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
                        color: Theme.of(context).buttonTheme.colorScheme!.background,
                      ),
                      color:  Theme.of(context).colorScheme.background,
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
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Form(
                    key: _demandekey,

                    child: Column(
                      children: [

                        Container( height: 77,width: 308,
                          child: TextFormField(
                            cursorColor: Color(0xFF2541B2),
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: chapitreController,
                            decoration: InputDecoration(
                              hintText: 'Quel est le chapitre ? ',
                              prefixIcon:   Padding(
                                padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                                child:  Image(image: ExactAssetImage('images/question.png'),width: 40,height: 30,color: Theme.of(context).iconTheme.color,),
                              ),

                              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Theme.of(context).buttonTheme.colorScheme!.background,width: 1),),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:   Theme.of(context).buttonTheme.colorScheme!.background, width: 1,),),
                              hintStyle:Theme.of(context).textTheme.labelMedium,),

                          ),
                        ),
                 ],  ),
                )
            ),


                    Column(
                      children: [

                        Container( height: 77,width: 308,
                          child: TextFormField(
                            cursorColor: Color(0xFF2541B2),

                            style: Theme.of(context).textTheme.labelMedium,
                            controller: problemeController,
                            decoration: InputDecoration(
                              hintText: 'Decris nous ton problème ? ',
                              prefixIcon:   Padding(
                                padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                                child:  Image(image: ExactAssetImage('images/question.png'),width: 40,height: 30,color: Theme.of(context).iconTheme.color,),
                              ),

                              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 1),),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Theme.of(context).buttonTheme.colorScheme!.background, width: 1,),),
                              hintStyle: Theme.of(context).textTheme.labelMedium,),
                            validator: (value) => value != null
                                ? "Decris nous un peu plus ton problème ( le plus de détails possibles ) !"
                                : null,
                          ),
                        ),
                      ],  ),
                  ],
          ),

          Container(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.only(top: 50),
            height: 69,
            width: 159,
            child: ElevatedButton(onPressed: () async {


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
                    error = 'Rentrez une adresse valide !';});}

          },
            style: ElevatedButton.styleFrom(
              backgroundColor:  Theme.of(context).buttonTheme.colorScheme!.background,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
            child:  Text("Envoyer ! ",style: Theme.of(context).textTheme.labelLarge,),),),

       ],),),


     );





  }
  
  void onAdLoaded(InterstitialAd ad) {
  }
}




