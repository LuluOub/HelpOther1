import 'package:helpother/screens/question.dart';
import 'package:helpother/screens/register/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/authentication.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {

  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      _formKey.currentState?.reset();
      error = '';
      emailController.text = '';
      nameController.text = '';
      passwordController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        backgroundColor: const Color(0xFFFCFFFC),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 24, right: 24,),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children :[ Container(height: 20,),
              Row(children: [Center(child :Container(padding: const EdgeInsets.only(top: 70),width: 350, child: Text( "Avant toutes choses il faut que tu t’inscrive !",
                style: GoogleFonts.breeSerif(
                  color: Color(0xFF323131),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center
                ,)),)],),
              Container(padding:EdgeInsets.only(top: 20),child: Divider(color: Colors.black,endIndent: 20,indent: 20,thickness: 2,),),


              Column( children : [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                          Container(margin: EdgeInsets.only(top: 16), height: 77,width: 338,
                            child: TextFormField(
                              cursorColor: Colors.blueAccent,
                              style: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),
                              controller: nameController,

                              decoration: InputDecoration(hintText: 'Rentre ton pseudo !',
                                prefixIcon:   Padding(
                                  padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                                  child:  Image(image: ExactAssetImage('images/user.png'),width: 40,height: 30,),
                                ),
                                  focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Color(0xFF387CFF),width: 1.5,),),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color: Color(0xFF387CFF), width:1.5,),),
                                  hintStyle: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),),
                              validator: (value) => value != null && value.length < 6
                                  ? "Rentre un pseudo avec au moins 6 lettres !"
                                  : null,
                            ),
                          ),




                      Container( margin: EdgeInsets.only(top: 16), height: 77,width: 338,
                        child: TextFormField(
                          cursorColor: Colors.blueAccent,
                          style: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),
                          controller: emailController,
                          decoration: InputDecoration(hintText: 'Rentre ton email ! ',
                            prefixIcon:   Padding(
                              padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                              child:  Image(image: ExactAssetImage('images/Email.png'),width: 40,height: 30,),
                            ),
                            focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14.0), borderSide: BorderSide(color: Color(0xFF387CFF),width: 1.5,),),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0), borderSide:  BorderSide(color: Color(0xFF387CFF), width: 1.5,),),
                            hintStyle: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),),
                          validator: (value) => value != null && value.length < 6
                              ? "Rentre une addresse email valable !"
                              : null,
                        ),
                      ),

                      Container( margin: EdgeInsets.only(top: 16), height: 77,width: 338,
                        child: TextFormField(
                          style: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),
                          controller: passwordController,
                          decoration: InputDecoration(hintText: 'Rentre ton mot de passe !',
                            prefixIcon:   Padding(
                              padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                              child:  Image(image: ExactAssetImage('images/Key.png'),width: 40,height: 30,),
                            ),
                            focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14.0), borderSide: BorderSide(color: Color(0xFF387CFF),width: 1.5,),),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0), borderSide: const BorderSide(color: Color(0xFF387CFF), width: 1.5,),),
                            hintStyle: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),),
                          obscureText: true,
                          validator: (value) => value != null && value.length < 6
                              ? "Rentre un mot de passe avec au moins 6 caractère"
                              : null,
                        ),
                      ),

                      Divider(color: Colors.black, endIndent: 10,indent: 10,thickness: 2,)


                    ],

                  ),),
              ]),







              Container(width: 273,child: Text('Tu peux t’inscrire avec d’autre méthode ! ',style: GoogleFonts.breeSerif(
              color: Color(0xFF323131),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        textAlign: TextAlign.center,
        ),),



              Container( padding: EdgeInsets.only(top: 20),
                child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
                    ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor:  Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side: const BorderSide(color: Color(0xFF387CFF),width: 2),), child: Image(image: AssetImage("images/google.png"),),),
        ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: const Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Color(0xFF387CFF),width: 2),), child:  Image(image: AssetImage("images/apple.png"),color: Colors.black),),
        ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: const Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Color(0xFF387CFF),width: 2),), child:  Image(image: AssetImage("images/facebook.png"),color: Colors.black),),
        ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: const Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Color(0xFF387CFF),width: 2),), child:  Image(image: AssetImage("images/user.png"),color: Colors.black),),
                ],),
              ),

              Center(
                child : Container( padding: EdgeInsets.only(top: 10),
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("J’ai déjà un compte ?",
                        style: GoogleFonts.breeSerif(color: Color(0xFF323131), fontWeight: FontWeight.bold, fontSize: 15)),



                    ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent,
                        shape: StadiumBorder()),
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticateScreen())); },
                      child: Text('Connecte toi içi !', style: GoogleFonts.breeSerif(color: Color(0xFF387CFF), fontStyle: FontStyle.italic,fontSize: 15),) ,
                    ),],),
                ),),




              Container(
                  margin: EdgeInsets.only(bottom: 30,top: 30),
                  height: 70,
                  width: 159,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xFF3EC7FD),Color(0xFF0026FF),]),borderRadius: BorderRadius.circular(15)),
                  child : ElevatedButton(onPressed:() async {


                    if (_formKey.currentState?.validate() == true) {
                      setState(() => loading = true);
                      var Name = nameController.value.text;
                      var email = emailController.value.text;
                      var password = passwordController.value.text;

                      dynamic result = await _auth.registerWithEmailAndPassword(Name,email,password);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScreen()));
                      if (result == false) {
                        setState(() {
                          loading = false;
                          error = 'Rentrez une adresse valide !';});}}}
                    ,style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                        side:  BorderSide(color: Colors.transparent,width: 2), ),),
                    child:  Text("S'inscire !",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),),

              ),





            ],
          ),
        ),
      );


  }
}
