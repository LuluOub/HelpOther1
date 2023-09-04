
import 'package:helpother/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/BottomNavBar.dart';
import '/services/authentication.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {

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
  Widget build(BuildContext context) => Scaffold(

    backgroundColor: const Color(0xFFFCFFFC),
    body: SingleChildScrollView(
      padding: const EdgeInsets.only(left: 24, right: 24,),
      child: Column(
        children :[


          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child :
                Container(
                    padding: const EdgeInsets.only(top: 70),width: 350, child: Text("Ca fait plaisir de te revoir !",
                  style: GoogleFonts.breeSerif(color: Color(0xFF323131), fontWeight: FontWeight.bold, fontSize: 30,),textAlign: TextAlign.center,)),)],),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child :
                Container(
                    padding: const EdgeInsets.only(top: 18),width: 300, child: Text("Connecte-toi !", style: GoogleFonts.breeSerif(
            color: Color(0xFF323131),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),textAlign: TextAlign.center,)),)],),

          Container(padding: EdgeInsets.only(top: 10) ,child: Divider(color: Colors.black, endIndent: 20,indent: 20, thickness: 2)),




          Column( children : [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(margin: EdgeInsets.only(top: 20), height: 77,width: 338,
                    child: TextFormField(
                      cursorColor: Colors.blueAccent,




                      style: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Rentre ton email ! ',
                        prefixIcon:   Padding(
                          padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                          child:  Image(image: ExactAssetImage('images/Email.png'),width: 40,height: 30,),
                        ),
                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF387CFF),width: 1.5),),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Color(0xFF387CFF), width: 1.5,),),
                        hintStyle: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),),
                      validator: (value) => value != null && value.length < 6
                          ? "Rentre une addresse email valable !"
                          : null,
                    ),
                  ),

                  Container(padding: EdgeInsets.only(top: 16) , height: 77,width: 338,
                    child: TextFormField(



                      style: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Rentre ton mot de passe !',
                        prefixIcon:   Padding(
                          padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                          child:  Image(image: ExactAssetImage('images/Key.png'),width: 40,height: 30,),
                        ),
                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14.0), borderSide: BorderSide(color: Color(0xFF387CFF),width: 1.5),),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0), borderSide: const BorderSide(color: Color(0xFF387CFF), width: 1.5,),),
                        hintStyle: GoogleFonts.aBeeZee(color: Color(0xFF1E1E1E),fontSize: 20,fontStyle: FontStyle.italic),),
                      obscureText: true,
                      validator: (value) => value != null && value.length < 6
                          ? "Rentre un mot de passe avec au moins 6 caractère"
                          : null,
                    ),
                  ),
                Container(padding: EdgeInsets.only(top: 20),child: Divider(color: Colors.black, endIndent: 20,indent: 20,thickness: 2)),


                  Container(width: 270,padding: EdgeInsets.only(top: 10), child: Text(textAlign: TextAlign.center,'Connecte toi avec d’autre méthode ! ',style: GoogleFonts.breeSerif(color: Color(0xFF323131), fontWeight: FontWeight.bold, fontSize: 25,)),)

                ],

              ),),
          ]),










          Container( padding: EdgeInsets.only(top: 30),
            child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
              ElevatedButton(onPressed:() async {await _auth.signInWithGoogle();},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor:  Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side: const BorderSide(color: Color(0xFF387CFF),width: 2),), child: Image(image: AssetImage("images/google.png"),),),
              ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: const Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Color(0xFF387CFF),width: 2),), child:  Image(image: AssetImage("images/apple.png"),color: Colors.black),),
              ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: const Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Color(0xFF387CFF),width: 2),), child:  Image(image: AssetImage("images/facebook.png"),color: Colors.black),),
              ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: const Color(0xFFFCFFFC),shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Color(0xFF387CFF),width: 2),), child:  Image(image: AssetImage("images/user.png"),color: Colors.black),),
            ],),
          ),
          Center(
            child : Container( padding: EdgeInsets.only(top: 20),
              child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [
                Text("Vous n'avez pas de compte ?",
                    style: GoogleFonts.breeSerif(color: Color(0xFF323131), fontWeight: FontWeight.bold, fontSize: 15)),



                ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent,
                    shape: StadiumBorder()),
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())); },
                  child: Text('Inscrit toi içi', style: GoogleFonts.breeSerif(color: Color(0xFF387CFF), fontStyle: FontStyle.italic,fontSize: 15),) ,
                ),],),
            ),),

          Container( padding: EdgeInsets.only(top: 20)  ,
            child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
              ElevatedButton(onPressed:() async {
                if (_formKey.currentState?.validate() == true) {
                  setState(() => loading = true);
                  var email = emailController.value.text;
                  var password = passwordController.value.text;

                  dynamic result;
                  await _auth.signInWithEmailAndPassword(email, password,);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => menu()));
                  if (result == false) {
                    setState(() {
                      loading = false;
                      error = 'Rentrez une adresse valide !';});}}},
                style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(159, 69),
                  backgroundColor:Color(0xFF387CFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                    side:  BorderSide(color: Color(0xFF387CFF),width: 2), ),),
                child:  Text("Se connecter !",style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),),
            ],),
          ),





        ],
      ),
    ),
  );


}
