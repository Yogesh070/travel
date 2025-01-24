import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/message/widgets/message_card.dart';

class MessageDetails extends StatelessWidget {
  final Conversation conversation;

  const MessageDetails({super.key, required this.conversation});
  Widget _buildMessage(int index) {
    final messageContent = conversation.messages[index];
    // if (messageContent.user == conversation.messages.se) {
    //   return SentMessageWidget(content: messageContent);
    // }
    return RecievedMessageWidget(receivedContent: messageContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Column(
          children: [
            Text(
              'Pradip Dhungana',
            ),
            Text(
              'Active Now',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(),
            Spacer(),
            for (int i = 0; i < conversation.messages.length; i++)
              _buildMessage(i),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.attach_file),
                      hintText: 'Type your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.voice_chat))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SentMessageWidget extends StatelessWidget {
  final MessageContent content;

  const SentMessageWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          color: Colors.lightBlue.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content.message),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(DateFormat.jm().format(content.sentAt)),
                Icon(Icons.check)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RecievedMessageWidget extends StatelessWidget {
  final MessageContent receivedContent;
  const RecievedMessageWidget({
    super.key,
    required this.receivedContent,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(receivedContent.userProfileImageUrl),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: const Color.fromARGB(255, 242, 246, 247),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receivedContent.message,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(DateFormat.jm().format(receivedContent.lastSentAt)),
                    Icon(Icons.check)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageContent {
  final String message;
  final DateTime sentAt;
  final String userProfileImageUrl;
  final bool isSeen;
  final String user;
  final DateTime lastSentAt;

  MessageContent({
    required this.message,
    required this.sentAt,
    required this.userProfileImageUrl,
    this.isSeen = false,
    required this.user,
    required this.lastSentAt,
  });
}
