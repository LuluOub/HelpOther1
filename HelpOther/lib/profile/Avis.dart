import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Avis extends StatefulWidget {
  const Avis({super.key});

  @override
  State<Avis> createState() => _AvisState();
}

class _AvisState extends State<Avis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( padding: EdgeInsets.only(top: 40),
                  child: Text('Donnez votre avis ! ', style: Theme.of(context).textTheme.titleLarge,),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Theme.of(context).colorScheme.background,thickness: 1,)),


            Container(padding: EdgeInsets.only(top: 50),
              child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
                ElevatedButton(onPressed:() {},
                  style: ElevatedButton.styleFrom(elevation: 3,
                    fixedSize: Size(159, 69),
                    backgroundColor:  Theme.of(context).buttonTheme.colorScheme!.background,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                      side:  BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 2), ),),
                  child:  Text("IOS !",style: Theme.of(context).textTheme.labelLarge,),),
              ],),
            ),
            Container(padding: EdgeInsets.only(top: 50),
              child: Row (mainAxisAlignment: MainAxisAlignment.spaceEvenly,children : [
                ElevatedButton(onPressed:() {},
                  style: ElevatedButton.styleFrom(elevation: 3,
                    fixedSize: Size(159, 69),
                    backgroundColor:  Theme.of(context).buttonTheme.colorScheme!.background,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                      side:  BorderSide(color:Theme.of(context).buttonTheme.colorScheme!.background,width: 2), ),),
                  child:  Text("Android !",style: Theme.of(context).textTheme.labelLarge,),),
              ],),
            ),



          ],
        ),
      ),
    );
  }
}
