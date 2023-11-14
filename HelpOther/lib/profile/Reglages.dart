import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpother/theme/dark_theme.dart';
import 'package:helpother/theme/light_theme.dart';

class Reglages extends StatefulWidget {
  const Reglages({super.key});

  @override
  State<Reglages> createState() => _ReglagesState();
}

class _ReglagesState extends State<Reglages> {

  bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: Text('Reglages ', style: Theme.of(context).textTheme.titleLarge),),

              ],
    ),

            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),


            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 25,top: 30),
                    child:Image( image: ExactAssetImage('images/notification.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
                Container( padding: EdgeInsets.only(left: 25,top: 30),
                  child: Text('Notification : ',style: Theme.of(context).textTheme.titleMedium,),),
                Container( width: 100, padding: EdgeInsets.only(top: 30),
                  child: CheckboxListTile(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: checkboxValue1,
                      onChanged: (bool? value) {
                        setState(()  {
                          checkboxValue1 = value!;
                          print('check1: $checkboxValue2');

                        });
                 }),

                ),
              ],
            ),


            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),


            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 25,top: 30),
                    child:Image( image: ExactAssetImage('images/anonyme.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
                Container( padding: EdgeInsets.only(left: 25,top: 30),
                  child: Text('Compte privée : ',style: Theme.of(context).textTheme.titleMedium,),),
                Container( width: 100, padding: EdgeInsets.only(top: 30),
                  child: CheckboxListTile(
                    activeColor: Theme.of(context).colorScheme.primary,

                      value: checkboxValue2,
                      onChanged: (bool? value) {
                        setState(()  {
                          checkboxValue2 = value!;
                          print('check2: $checkboxValue2');
                        });
                      }),

                ),
              ],
            ),

            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 150,indent: 150,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),

            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 25,top: 30),
                    child:Image( image: ExactAssetImage('images/night.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
                Container( padding: EdgeInsets.only(left: 25,top: 30),
                  child: Text('Mode Nuit : ',style: Theme.of(context).textTheme.titleMedium,),),
                Container( width: 100, padding: EdgeInsets.only(top: 30),
                  child: CheckboxListTile(
                      activeColor: Theme.of(context).colorScheme.primary,

                      value: checkboxValue3,
                      onChanged: (bool? value) {
                        setState(()  {
                          checkboxValue3 = value!;

                        });
                      }),

                ),
              ],
            ),
    ],
        ),
      ),
      );

  }
}
