

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpother/Chat/List_Discussion.dart';
import '../Chat/ChatPage.dart';


class Discussion extends StatefulWidget {
  const Discussion({Key? key}) : super(key: key);

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {

  firebase_auth.User? user;

  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body:
      Column(
        children: <Widget>[
          Container( padding: EdgeInsets.only(top:100),
            child: Text('Voici toutes les discussions !',style: GoogleFonts.breeSerif(
      color: Color(0xFF323131),
      fontWeight: FontWeight.bold,
      fontSize: 35,
    ), textAlign: TextAlign.center,),),
          Container( padding: EdgeInsets.only(top:10),
            child: Text('réponds-y',style: GoogleFonts.breeSerif(
      color: Color(0xFF323131),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ), textAlign: TextAlign.center,),),

          Container( padding: EdgeInsets.only(top: 10 ),
            child: Divider(color: Colors.black,endIndent: 50,indent: 50,thickness: 1,),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: _buildUserList(),
            ),
          ),
          Container(padding: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
            onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => List_Discussion()),);},
            style: ElevatedButton.styleFrom(elevation: 3,
            fixedSize: Size(209, 69),
            backgroundColor:  Color(0xFF387CFF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
            side:  BorderSide(color: Color(0xFF387CFF),width: 2), ),),
            child:  Text('Voir mes discussions',style: GoogleFonts.bowlbyOneSc(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14),)

          ),)
        ],

      )
    );
  }



  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('demande').snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Text('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text('Waiting...');
        }
        return ListView( padding: EdgeInsets.only(left: 16,right: 16,top: 10),
          children:


          snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document){
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
          onTap: () async {

            FirebaseFirestore.instance.collection('list_disc').add({
              'name': data['name'],
              'email': data['email'],
              'uid': data['uid'], 'chapitre': data['chapitre'],'jour' : data['jour'],'Matière' :data['Matière']});
            Navigator.push(context,MaterialPageRoute(builder: (context) => List_Discussion()),);

            await rejectJob(data['uid']);



          },


      );
    } else{
      return Container();
    }

  }
  Future<void> rejectJob(String jobId){
    return _firestore.collection('demande').doc(jobId).delete();
  }
}
