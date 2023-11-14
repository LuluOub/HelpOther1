

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpother/Chat/List_Discussion.dart';


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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Theme.of(context).colorScheme.background,


      body:
      Column(
        children: <Widget>[
          Container( padding: EdgeInsets.only(top:100),
            child: Text('Voici toutes les discussions !',style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),),
          Container( padding: EdgeInsets.only(top:10),
            child: Text('réponds-y',style:  Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),),

          Container( padding: EdgeInsets.only(top: 10 ),
            child: Divider(color: Theme.of(context).colorScheme.secondary,endIndent: 50,indent: 50,thickness: 1,),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: _buildUserList(),
            ),
          ),
          Container(
            width: 159,
            height: 69,


            margin: EdgeInsets.only(bottom: 24,top: 30),
            child: ElevatedButton(
            onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => List_Discussion()),);},
            style: ElevatedButton.styleFrom(
            backgroundColor:  Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
            side:  BorderSide(color: Theme.of(context).buttonTheme.colorScheme!.background,width: 2), ),),
            child:  Text('Mes chats',style: Theme.of(context).textTheme.labelLarge)

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
      return  ListTile(


         trailing: Icon(Icons.arrow_forward_ios_outlined,color: Theme.of(context).iconTheme.color,size: 40,),
          subtitle: Row(
            children: [
              Text('Jour :  ',style: Theme.of(context).textTheme.titleMedium),
              Text(data['jour'],style: Theme.of(context).textTheme.titleMedium),
            ],
          ),


          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Theme.of(context).colorScheme.primary)),
          title: Row(
            children: [
              Text('Matiere :  ',style: Theme.of(context).textTheme.titleMedium),
              Container(child: Text(data['Matière'],style: Theme.of(context).textTheme.titleMedium)),
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
