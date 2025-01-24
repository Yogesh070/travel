import 'package:flutter/material.dart';
import 'package:travel_app/message/widgets/message_card.dart';

class ConversationController extends ChangeNotifier {
  List<Conversation> conversations = [
    Conversation(
        profileImage:
            'https://images.pexels.com/photos/30319457/pexels-photo-30319457/free-photo-of-close-up-portrait-of-a-domestic-cat.jpeg',
        userName: 'Pradip Dhungana',
        isSeen: false,
        messages: [

      ]
    ),
  ];

  void addConversation(String name) {
    conversations.add(
      Conversation(
        userName: name,
        profileImage:
            'https://images.pexels.com/photos/30319457/pexels-photo-30319457/free-photo-of-close-up-portrait-of-a-domestic-cat.jpeg',
      ),
    );
    notifyListeners();
  }
  //TODO: FEATURE: SEND MESSGE
  // SELECT A CONVERSATION AND NAVIGATE TO MESSAGE DETAILS PAGE
  // GET TEXT CONTENT FROM TEXTFIELD IN MESSSAGE DETAIL SCREEN
  // WHEN PRESSED ENTER OR CLICK SEND BUTTON -> ADD MESSGE TO message list property on conversation
}
