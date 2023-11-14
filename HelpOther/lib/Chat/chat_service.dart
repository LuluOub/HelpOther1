import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpother/models/message.dart';




class ChatService extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> sendMessage(String receiverId, String message) async {
  // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String currentUserName = _firebaseAuth.currentUser!.displayName.toString();
    final Timestamp timestamp = Timestamp.now();


  // creer un nouveau messages
    Messages newMessage = Messages(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        senderName: currentUserName,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp
    );


    // Construction d'un ecran pour parler d'un current user to a receiver id
    List<String> ids = [currentUserId,receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");


    // add new message to database

    await _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(newMessage.toMap());

  }

  // Get messages

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    
    return  _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp',descending: false).snapshots();
  }

  Future<void>  suprDiscussion(String currentUserId, String receiverId) async {
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore.collection('chat_rooms').doc(chatRoomId).delete();

  }
}


