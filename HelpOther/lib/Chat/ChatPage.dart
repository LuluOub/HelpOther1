import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  firebase_auth.User? user;


  @override
  void initState() {
    super.initState();
    this.user = firebase_auth.FirebaseAuth.instance.currentUser;
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,

          title: Text(widget.receiverUserName,style:  Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>( icon: ImageIcon(
              AssetImage('images/MoreD.png'),
              color: Theme.of(context).iconTheme.color,
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
                      Icon(Icons.stop_circle, color: Theme.of(context).iconTheme.color,),
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
                      Icon(Icons.more_horiz,color: Theme.of(context).iconTheme.color,),
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
              color: Theme.of(context).colorScheme.tertiary,
              elevation: 2,
            ),
          ],
          leading: IconButton( padding: EdgeInsets.only(left: 20),
            icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).iconTheme.color),
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

            cursorColor: Color(0xFF2541B2),
            textAlign: TextAlign.center,

            decoration: InputDecoration(

              hintStyle: Theme.of(context).textTheme.titleMedium ,
              hintText: 'Entre ton message',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0,right: 20),
                child: IconButton(onPressed: sendMessage,icon:  Icon(Icons.photo,size: 40,color: Theme.of(context).iconTheme.color,),),
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,),borderRadius: BorderRadius.circular(10)),
             disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,),borderRadius: BorderRadius.circular(10)),
              fillColor: Theme.of(context).colorScheme.background,
              filled: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0,right: 20),
                child: IconButton(onPressed: sendMessage,icon:  Icon(Icons.keyboard_arrow_up_outlined,size: 40,color: Theme.of(context).iconTheme.color,),),
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
                Row(
                  crossAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                  mainAxisAlignment:
                  (data['senderId'] == _firebaseAuth.currentUser!.uid)
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,

                  children: [


                        Container(

                          padding: EdgeInsets.only(right: 10),
                          child: TextAvatar(
                            shape: Shape.Circular,
                            size: 10,
                            textColor: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            upperCase: true,
                            backgroundColor: Colors.blue,
                            numberLetters: 1,
                            text: "${user!.displayName}",
                          ),
                        ), 

                Container( padding:
                   (data['senderId'] == _firebaseAuth.currentUser!.uid)
                       ? EdgeInsets.only(bottom: 10)
                       : EdgeInsets.only(top: 10),
                    child: Text(data['senderName'],style: Theme.of(context).textTheme.titleMedium,)),
                  ],
        ),
            SizedBox(height: 5,),
            ChatBubble(message :data['message']),
    ]

        ),
      ),
    );
  }


  showAlertDialog(BuildContext context) {
    Widget cancelButton = FilledButton(
      child: Text("Annuler"),
      style: FilledButton.styleFrom(backgroundColor: Color(0xFF2541B2),),
      onPressed:  () { Navigator.of(context).pop();},
    );
    Widget continueButton = FilledButton(
      child: Text("Continuer"),
      style: FilledButton.styleFrom(backgroundColor: Color(0xFF2541B2),),
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



