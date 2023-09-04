import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String senderName;
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;


  Messages({
    required  this.senderName,
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,

});

  Map<String, dynamic> toMap(){
    return{
      'senderName' : senderName,
      'senderId' : senderId,
      'senderEmail': senderEmail,
      'receiverId' : receiverId,
      'message' : message,
      'timestamp' : timestamp,
    };
  }
}