import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/message/message_details.dart';

enum UserStatus {
  active,
  offline,
  busy,
  donotdisturb,
}

class MessageCard extends StatelessWidget {
  final Conversation conversation;
  final UserStatus status;

  const MessageCard({
    super.key,
    required this.conversation,
    this.status = UserStatus.active,
  });

  Color getColorBasedOnStatus() {
    switch (status) {
      case UserStatus.active:
        return Colors.greenAccent;
      case UserStatus.offline:
        return Colors.grey;
      case UserStatus.donotdisturb:
        return Colors.red;
      case UserStatus.busy:
        return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.goNamed(
          'message-details',
          pathParameters: {
            'username': conversation.userName,
          },
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(conversation.profileImage),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(7),
                color: getColorBasedOnStatus(),
              ),
              height: 14,
              width: 14,
            ),
          )
        ],
      ),
      title: Text(conversation.userName),
      subtitle: conversation.isTyping
          ? Text(
              'Typing...',
              style: TextStyle(color: Colors.blue),
            )
          : Text(conversation.messages.isNotEmpty
              ? conversation.messages.last.message
              : '-'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: conversation.isRead,
            child: Icon(Icons.check_box, color: Colors.green),
          ),
          // conversation.isSeen ? Icon(Icons.check) : SizedBox(),
          Visibility(
            visible: conversation.isSeen,
            child: Icon(Icons.check),
          ),
          // Text(DateFormat.jm().format(message.messages.last.lastSentAt)),
        ],
      ),
    );
  }
}

class Conversation {
  final String profileImage;
  final String userName;
  final bool isSeen;
  final bool isTyping;
  final bool isRead;
  List<MessageContent> messages;

  Conversation({
    required this.profileImage,
    this.isSeen = false,
    this.messages = const [],
    required this.userName,
    this.isTyping = false,
    this.isRead = false,
  });
}
