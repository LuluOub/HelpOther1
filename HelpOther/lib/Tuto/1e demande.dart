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

  firebase_auth.User? users;




  Future<String> firebaseGetData() async {
    String role;
    DocumentSnapshot ds =
    await FirebaseFirestore.instance.collection("users").doc(users?.uid).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    print(data["role"] as String);
    role = data['role'];// check if it null or not
    return role;

  }

  late String role1;
  @override
  void initState() {
    super.initState();
    this.users = firebase_auth.FirebaseAuth.instance.currentUser;
    firebaseGetData().then((String string) => role1 = string);
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


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [


            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( width: 350, padding: EdgeInsets.only(top: 100),
                  child: Text("Pour débuter remplis ses cases pour nous aider sur comment t’aider !", style: Theme.of(context).textTheme.titleLarge,
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
                            'Selectionne une matiere ',
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
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        color: Theme.of(context).colorScheme.background,
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
                          border: Border.all(color: Theme.of(context).colorScheme.primary)
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

            Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 50,indent: 50,thickness: 1,),

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
                            'Selectionne un jour ',
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

            Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 50,indent: 50,thickness: 1,),


          Column(children: [
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Form(
                    key: _demandekey,

                    child: Column(
                      children: [

                        Container( height: 77,width: 308,
                          child: TextFormField(
                            cursorColor: Theme.of(context).colorScheme.primary,
                            minLines: 1,
                            maxLines: 5,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: chapitreController,
                            decoration: InputDecoration(
                              hintText: 'Quel est le chapitre ? ',
                              prefixIcon:   Padding(
                                padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                                child:  Image(image: ExactAssetImage('images/question.png'),width: 40,height: 30,color: Theme.of(context).iconTheme.color,),
                              ),

                              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:Theme.of(context).colorScheme.primary,width: 1),),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:Theme.of(context).colorScheme.primary, width: 1,),),
                              hintStyle: Theme.of(context).textTheme.labelMedium),
                            validator: (value) => value != null && value.length < 10
                                ? "Rentre un chapitre pour qu'on puisse bien t'eguiller "
                                : null,
                          ),
                        ),
                      ],  ),
                  )
              ),

              Container(padding: EdgeInsets.only(bottom: 20),child: Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 50,indent: 50,thickness: 1,)),

              Column(
                children: [

                  Container( height: 77,width: 308,
                    child: TextFormField(
                      cursorColor: Theme.of(context).colorScheme.primary,

                      style: Theme.of(context).textTheme.labelMedium,
                      controller: problemeController,
                      decoration: InputDecoration(
                        hintText: 'Decris nous ton problème ? ',
                        prefixIcon:   Padding(
                          padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                          child:  Image(image: ExactAssetImage('images/question.png'),width: 40,height: 30,color: Theme.of(context).iconTheme.color,),
                        ),

                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Theme.of(context).colorScheme.primary,width: 1),),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Theme.of(context).colorScheme.primary, width: 1,),),
                        hintStyle: Theme.of(context).textTheme.labelMedium,),
                      validator: (value) => value != null && value.length < 25
                          ? "Decris nous un peu plus ton problème ( le plus de détails possibles ) !"
                          : null,
                    ),
                  ),
                ],  ),
            ],
            ),
            Container(

              margin: EdgeInsets.only(bottom: 24,top: 20),
              width: 159,
              height: 69,
              child: ElevatedButton(

                onPressed: () async {
                  FirebaseFirestore.instance.collection('demande').doc(users?.uid).set({
                    'name': users?.displayName,
                    'email': users?.email,
                    'uid': users?.uid,
                    'role': role1,
                    'chapitre': chapitreController.text,'demande' : problemeController.text,'jour' : selectedJour.toString(),'Matière' : selectedValue.toString(),});
                  problemeController.clear();
                  chapitreController.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));

                  setState(() {
                    checked = !checked;
                  });


                  dynamic result;
                  if (result == false) {
                    setState(() {
                      error = 'Rentrez une adresse valide !';});}

                },
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary,elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
                child: Text(
                    "C'est Fait !",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge
                ),
              ),
            ),



            Row( mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container( padding: EdgeInsets.only(right: 20,top: 10),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent,
                      shape: StadiumBorder()),
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => menu())); },
                    child: Text('Passer pour l’instant', style: Theme.of(context).textTheme.headlineLarge,) ),
                ),
              ],
            ),

          ],
        ),
      ),




    );

  }
}
