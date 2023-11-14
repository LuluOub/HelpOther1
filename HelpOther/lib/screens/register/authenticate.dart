
import 'package:helpother/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    backgroundColor:  Theme.of(context).colorScheme.background,
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
                  style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,)),)],),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child :
                Container(
                    padding: const EdgeInsets.only(top: 18),width: 300, child: Text("Connecte-toi !", style:  Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,)),)],),

          Container(padding: EdgeInsets.only(top: 10) ,child: Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 20,indent: 20, thickness: 2)),




          Column( children : [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(margin: EdgeInsets.only(top: 20), height: 77,width: 338,
                    child: TextFormField(
                      cursorColor: Colors.blueAccent,
                      style: Theme.of(context).textTheme.labelMedium,
                      controller: emailController,

                      decoration: InputDecoration(
                        hintText: 'Rentre ton email ! ',
                        prefixIcon:   Padding(
                          padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                          child:  Image(image: ExactAssetImage('images/Email.png'),width: 40,height: 30,color: Theme.of(context).iconTheme.color,),
                        ),

                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Theme.of(context).colorScheme.primary,width: 1.5),),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide:  BorderSide(color:  Theme.of(context).colorScheme.primary, width: 1.5,),),
                        hintStyle: Theme.of(context).textTheme.labelMedium,),
                      validator: (value) => value != null && value.length < 6
                          ? "Rentre une addresse email valable !"
                          : null,
                    ),
                  ),

                  Container(padding: EdgeInsets.only(top: 16) , height: 77,width: 338,
                    child: TextFormField(



                      style: Theme.of(context).textTheme.labelMedium,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Rentre ton mot de passe !',
                        prefixIcon:   Padding(
                          padding: EdgeInsets.only(left : 15,right: 15,bottom: 2), // add padding to adjust icon
                          child:  Image(image: ExactAssetImage('images/Key.png'),width: 40,height: 30,color: Theme.of(context).iconTheme.color),
                        ),
                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14.0), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 1.5),),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0), borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5,),),
                        hintStyle: Theme.of(context).textTheme.labelMedium,),
                      obscureText: true,
                      validator: (value) => value != null && value.length < 6
                          ? "Rentre un mot de passe avec au moins 6 caractère"
                          : null,
                    ),
                  ),
                Container(padding: EdgeInsets.only(top: 20),child: Divider(color: Theme.of(context).colorScheme.secondary, endIndent: 20,indent: 20,thickness: 2)),


                  Container(width: 270,padding: EdgeInsets.only(top: 10), child: Text(textAlign: TextAlign.center,'Connecte toi avec d’autre méthode ! ',style: Theme.of(context).textTheme.titleMedium),)

                ],

              ),),
          ]),










          Container( padding: EdgeInsets.only(top: 30),
            child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
              ElevatedButton(onPressed:()  {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor:  Theme.of(context).colorScheme.background,shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Theme.of(context).colorScheme.primary,width: 2),), child: Image(image: AssetImage("images/google.png",),color: Theme.of(context).iconTheme.color,),),
              ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: Theme.of(context).colorScheme.background,shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Theme.of(context).colorScheme.primary,width: 2),), child:  Image(image: AssetImage("images/apple.png"),color: Theme.of(context).iconTheme.color),),
              ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: Theme.of(context).colorScheme.background,shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Theme.of(context).colorScheme.primary,width: 2),), child:  Image(image: AssetImage("images/facebook.png"),color: Theme.of(context).iconTheme.color),),
              ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(elevation: 3,fixedSize: Size(74, 68),backgroundColor: Theme.of(context).colorScheme.background,shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),side:  BorderSide(color: Theme.of(context).colorScheme.primary,width: 2),), child:  Image(image: AssetImage("images/user.png"),color: Theme.of(context).iconTheme.color),),
            ],),
          ),
          Center(
            child : Container( padding: EdgeInsets.only(top: 20),
              child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [
                Text("Vous n'avez pas de compte ?",
                    style: Theme.of(context).textTheme.headlineLarge),



                ElevatedButton(style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent,
                    shape: StadiumBorder()),
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())); },
                  child: Text('Inscrit toi içi', style: Theme.of(context).textTheme.headlineMedium,) ,
                ),],),
            ),),

          Container(
            margin: EdgeInsets.only(bottom: 30,top: 30),
            height: 70,
            width: 159,
            child: ElevatedButton(onPressed:() async {
                if (_formKey.currentState?.validate() == true) {
                  setState(() => loading = true);
                  var email = emailController.value.text;
                  var password = passwordController.value.text;

                  dynamic result = await _auth.signInWithEmailAndPassword(email, password,);
                  if (result == false) {
                    setState(() {
                      loading = false;
                      error = 'Rentrez une adresse valide !';});}}},

              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).buttonTheme.colorScheme!.background,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                    side:  BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 2), ),),
                child:  Text("Se connecter !",style: Theme.of(context).textTheme.labelLarge,),),
          ),





        ],
      ),
    ),
  );


}
