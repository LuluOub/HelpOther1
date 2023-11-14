import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
class DesProblemes extends StatefulWidget {
  const DesProblemes({super.key});

  @override
  State<DesProblemes> createState() => _DesProblemesState();
}

class _DesProblemesState extends State<DesProblemes> {


  firebase_auth.User? user;

  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton( padding: EdgeInsets.only(left: 20),
          icon: Icon(Icons.arrow_back_ios, color:  Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.of(context).pop(),
        ),

        title: Text('Les Infos',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
        centerTitle: true,),
      body:Column(
        children: <Widget>[
          Container( padding: EdgeInsets.only(top:50), width: 300,
            child: Text('Voici les infos de la demande !',style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),),
          Container( padding: EdgeInsets.only(top: 10 ),
            child: Divider(color: Theme.of(context).colorScheme.secondary,endIndent: 50,indent: 50,thickness: 1,),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: _buildUserList(),
            ),
          ),
        ],

      )
    );
  }


  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('demande').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Waiting...');
        }
        return ListView(padding: EdgeInsets.only(left: 16, right: 16, top: 10),
          children:


          snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }


  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        subtitle: Column(
          children: [
            Row(
              children: [

            Container(width: 150,padding: EdgeInsets.only(top: 50),
                child: Text('- Chapitre :  ', style: Theme.of(context).textTheme.titleMedium,)),
            Container( width: 150,padding: EdgeInsets.only(top: 50),
              child: Text(data['chapitre'],
                style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
            ),
          ], ),
            new Row(
              children: [
                SizedBox(height: 10,),
                Container( padding: EdgeInsets.only(top: 50), width: 150,
                    child: Text('- Problème :  ',style: Theme.of(context).textTheme.titleMedium,)),
                Container( padding: EdgeInsets.only(top:50), width: 150,
                    child: Text(data['demande'], style:Theme.of(context).textTheme.titleMedium)),

              ],
            ),
            new Row(
              children: [
                Container( padding: EdgeInsets.only(top: 50), width: 150,
                    child: Text('- Jour :  ',style: Theme.of(context).textTheme.titleMedium,)),
                Container( padding: EdgeInsets.only(top:50), width: 150,
                    child: Text(data['jour'], style: Theme.of(context).textTheme.titleMedium)),
              ],

            )
          ],
        ),
        title: Column(
          children: [
            Row( children : [
            Container( padding: EdgeInsets.only(top: 50), width: 150,
              child: Text(
                  '- Matière :  ',style: Theme.of(context).textTheme.titleMedium),
            ),
            Container( padding: EdgeInsets.only(top:50), width: 150,
                child: Text(data['Matière'], style: Theme.of(context).textTheme.titleMedium,)),],),
          ],
        ),


      );
    } else {
      return Container();
    }
  }
}