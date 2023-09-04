import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpother/Chat/chatBubble.dart';
import 'package:helpother/Chat/chat_service.dart';

import 'Despcription.dart';

class ChatPage extends StatefulWidget {
  final String receiveruserEmail;
  final String receiverUserId;
  final String receiverUserName;


  const ChatPage({super.key, required this.receiveruserEmail, required this.receiverUserId,required this.receiverUserName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}


class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  void sendMessage() async {

    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(
          widget.receiverUserId, _messageController.text
      );
      _messageController.clear();
    }
  }

  void suprDiscussion() async{
      await _chatService.suprDiscussion(_firebaseAuth.currentUser!.uid, widget.receiverUserId);


  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFFCFFFC),
      appBar: AppBar(
          backgroundColor: Color(0xFFFCFFFC),
          elevation: 0,

          title: Text(widget.receiverUserName,style: GoogleFonts.montserrat(color: Colors.black,),textAlign: TextAlign.center,),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>( icon: ImageIcon(
              AssetImage('images/MoreD.png'),
              color: Colors.black,
            ), padding: EdgeInsets.only(right: 20),
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  onTap: () {
                    showAlertDialog(context);
                    },
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      Icon(Icons.stop_circle),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("Fin de la conversation")
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => DesProblemes()),);
                },

                  value: 2,
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.more_horiz),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("A propos")
                    ],
                  ),
                ),
              ],

              offset: Offset(0, 50),
              color: Color(0xFFD6D6D6),
              elevation: 2,
            ),
          ],
          leading: IconButton( padding: EdgeInsets.only(left: 20),
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),


      body: Column(
        children: [
          Expanded(child: _buildMessageList()),

          _buildMessageInput(),

          SizedBox(height: 25,)

        ],
      ),
    );
  }


  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context,snapshot){
          if (snapshot.hasError){
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Text('Loading ...');
          }
          return ListView(
            children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
          );
        },
    );
}



  Widget _buildMessageInput(){
    return Row(
      children: [
        Container(
          child: Expanded( child :
          TextFormField(
            controller: _messageController,

            cursorColor: Colors.blue,
            textAlign: TextAlign.center,

            decoration: InputDecoration(
hintStyle: GoogleFonts.montserrat(color: Colors.black),
              hintText: 'Entre ton message',
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,),borderRadius: BorderRadius.circular(10)),
             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,),borderRadius: BorderRadius.circular(10)),

              suffixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0,right: 10),
                child: IconButton(onPressed: sendMessage,icon: const Icon(Icons.arrow_upward,size: 40,color: Colors.black,),),
              )


            ),
            obscureText: false,

          )),
        ),
        
      ],
    );
  }


  Widget _buildMessageItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data() as Map<String,dynamic>;

    var aligment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
      ? Alignment.centerRight
      : Alignment.centerLeft;

    return Container(
      alignment: aligment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
          (data['senderId'] == _firebaseAuth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
          mainAxisAlignment:
          (data['senderId'] == _firebaseAuth.currentUser!.uid)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,

          children: [
            Text(data['senderName'],style: GoogleFonts.montserrat(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            ChatBubble(message :data['message']),
          ],
        ),
      ),
    );
  }


  showAlertDialog(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      child: Text("Annuler"),
      onPressed:  () { Navigator.of(context).pop();},
    );
    Widget continueButton = FilledButton(
      child: Text("Continuer"),
      onPressed:  () async {suprDiscussion;}
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Fermeture de la discussion"),
      content: Text("Voulez vous vraiment finir cette discussion ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
