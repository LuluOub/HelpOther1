import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ChatPage.dart';

class List_Discussion extends StatefulWidget {
  const List_Discussion({super.key});

  @override
  State<List_Discussion> createState() => _List_DiscussionState();
}

class _List_DiscussionState extends State<List_Discussion> {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _buildDiscList(),
    );
  }

  Widget _buildDiscList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('list_disc').snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Text('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text('Waiting...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildDiscListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildDiscListItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if(_auth.currentUser!.email != data['email']){
      return ListTile(

        trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 40,),
        subtitle: Row(
          children: [
            Text('Jour :  ',style: GoogleFonts.breeSerif(color: Colors.black,fontSize: 20),),
            Text(data['jour'],style: GoogleFonts.breeSerif(color: Colors.black,fontSize: 20),),
          ],
        ),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.black)),
        title: Row(
          children: [
            Text('Matiere :  ',style: GoogleFonts.breeSerif(color: Colors.black,fontSize: 20)),
            Container(child: Text(data['Matière'],style: GoogleFonts.breeSerif(color: Colors.black,fontSize: 20),)),
          ],

        ),

        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage(
            receiveruserEmail: data['email'],
            receiverUserId: data['uid'],
            receiverUserName: data['name'],
          ),),);
        },

      );
    } else{
      return Container();
    }

  }
}