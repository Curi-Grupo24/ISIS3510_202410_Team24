// ignore_for_file: always_specify_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //SenfMessage
  Future<void> sendMessage(String receiveruId, String message) async {
    String currentUserId = _auth.currentUser!.uid;
    String currentEmail = _auth.currentUser!.email.toString();

    Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      message: message,
      receiverId: receiveruId,
      senderEmail: currentEmail,
      senderId: currentUserId,
      timestamp: timestamp,
    );

    List<String> ids = <String>[currentUserId, receiveruId]..sort();

    String chatRoomId = ids.join('_');

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //Get Message
  Stream<QuerySnapshot> getMessages(String userID, String otherUserId) {
    List<String> ids = <String>[userID, otherUserId]..sort();

    String sortedIds = ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(sortedIds)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
