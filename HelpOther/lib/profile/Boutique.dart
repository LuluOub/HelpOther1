import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
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
                  child: Text('La boutique :', style: Theme.of(context).textTheme.titleLarge,),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(top: 15),child: Divider(endIndent: 50,indent: 50,color: Theme.of(context).colorScheme.secondary,thickness: 1,)),





            Row(
              children: [
                Container( padding: EdgeInsets.only(top: 40,left: 50),
                  child: Text('A venir !', style: Theme.of(context).textTheme.titleMedium),),
              ],
            ),






          ],
        ),
      ),
    );
  }
}
