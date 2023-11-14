import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
                  child: Text('Contacte nous ! ', style: Theme.of(context).textTheme.titleLarge,),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),



          Row(
              children: [
          Container(
          padding: EdgeInsets.only(left: 25,top: 50),
          child:Image( image: ExactAssetImage('images/Email.png',),width: 40,height: 40,color: Theme.of(context).iconTheme.color,)),
      Container( padding: EdgeInsets.only(left: 25,top: 50),
        child: Text('Email : ',style: Theme.of(context).textTheme.titleMedium,),),
      Container( padding: EdgeInsets.only(left: 25,top: 55),
        child: Text('lucasoubaiche@gmail.com',style: Theme.of(context).textTheme.titleSmall,),),




      ],

    ),




            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container( padding: EdgeInsets.only(left: 25,top: 50), width: 356,
                  child: Text('Mais avant regarde on a peut etre deja repondu a ta questions sur notre site !',textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,),),

              ]
            ),

            Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container( child: Icon(Icons.arrow_downward,color: Theme.of(context).iconTheme.color,size: 50,)),
                ]
            ),

            Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container( padding: EdgeInsets.only(left: 25,top: 30), width: 356,
                    child: Text('www.HelpOther.com/faq',textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),),

                ]
            ),

          ],
        ),
      ),

    );
  }
}
