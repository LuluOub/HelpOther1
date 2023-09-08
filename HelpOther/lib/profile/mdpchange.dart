import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class Mdpchange extends StatefulWidget {
  const Mdpchange({Key? key}) : super(key: key);

  @override
  State<Mdpchange> createState() => _MdpchangeState();
}


class _MdpchangeState extends State<Mdpchange> {


  firebase_auth.User? user;
final _formKey = GlobalKey<FormState>();

final mdpcontroller = TextEditingController();
final passwordsure = TextEditingController();
String error = '';
@override

  
  void dispose() {
    passwordsure.dispose();
    mdpcontroller.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFFFCFFFC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFFFC),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children : [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child :
              Container(
                  padding:  EdgeInsets.only(top: 50),width: 350,
                  child: Text("Change ton mot de passe !",
                    style: GoogleFonts.breeSerif(color: Colors.black, fontSize:35, fontWeight: FontWeight.bold ),textAlign: TextAlign.center,)),)],),
          Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Colors.black,thickness: 1,)),

Column( children:[
  Form( key: _formKey,
    child:
          Column(
            children: [
              Container( padding: EdgeInsets.only(top: 20),
                height: 77,width: 308,
                child: TextFormField(
                  cursorColor: Color(0xFF2541B2),
                  style: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),
                  controller: mdpcontroller,
                  decoration: InputDecoration(
                    hintText: 'Rentre ton nouveau mdp ',
                    prefixIcon:   Padding(
                      padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                      child:  Image(image: ExactAssetImage('images/Key.png'),width: 40,height: 30,),
                    ),

                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF2541B2),width: 1),),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF2541B2), width: 1,),),
                    hintStyle: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),),
                  obscureText: true,
                  validator: (value) => value != null && value.length < 6
                      ? "Rentre un mot de passe a plus de 6 caractères !"
                      : null,
                ),
              ),

          Container(padding: EdgeInsets.only(top:20),
            height: 77,width: 308,
            child: TextFormField(
              cursorColor: Color(0xFF2541B2),
              style: GoogleFonts.montserrat(color: Color(0xFF2541B2),fontSize: 15),
              controller: passwordsure,
              decoration: InputDecoration(
                hintText: 'Confirme ton mot de passe',
                prefixIcon:   Padding(
                  padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                  child:  Image(image: ExactAssetImage('images/Key.png'),width: 40,height: 30,),
                ),

                focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF2541B2),width: 1),),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF2541B2), width: 1,),),
                hintStyle: GoogleFonts.montserrat(color: Color(0xFF1E1E1E),fontSize: 15),),
              obscureText: true,
              validator: (value) => value != null && value.length < 6
                  ? "Rentre un mot de passe a plus de 6 caractères !"
                  : null,
            ),
          ),
            ],
  ),
  ),
]
),
          Container(padding: EdgeInsets.only(top: 50),
            child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
              ElevatedButton(onPressed:() async {
                if(_formKey.currentState?.validate()== true) {
                  print("oeoeo");
                  var newpass = passwordsure.value.text;

                  user?.updatePassword(newpass);
                  print(newpass);
                  passwordsure.clear();
                  mdpcontroller.clear();
                  dynamic result;
                  if(result == false){
                    setState(() {
                      error = 'Remplissez bien votre nouveau mot de passe';
                    });
                  };
                };},
                style: ElevatedButton.styleFrom(elevation: 3,
                  fixedSize: Size(159, 69),
                  backgroundColor:  Color(0xFF2541B2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                    side:  BorderSide(color: Color(0xFF2541B2),width: 2), ),),
                child:  Text("Confirmer ",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),),),
            ],),
          ),

     ],
        )
      ),
    );


  }
}
