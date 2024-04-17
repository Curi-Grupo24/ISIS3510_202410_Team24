import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  Message({
    required this.message,
    required this.receiverId,
    required this.senderEmail,
    required this.senderId,
    required this.timestamp,
  });
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  //To convert it to a map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'senderId': senderId,
        'senderEmail': senderEmail,
        'receiverId': receiverId,
        'message': message,
        'timestamp': timestamp,
      };
}
