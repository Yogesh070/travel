import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controllers/conversation_controller.dart';
import 'package:travel_app/message/widgets/message_card.dart';

class MessageHome extends StatelessWidget {
  const MessageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Messages'),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Icon(Icons.edit)
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for chats & messages',
              ),
            ),
            Consumer<ConversationController>(
              builder: (context, value, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MessageCard(
                      conversation: value.conversations[index],
                      status: UserStatus
                          .values[Random().nextInt(UserStatus.values.length)],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: value.conversations.length,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['Pradip', 'Projwal']
                    .map(
                      (user) => ListTile(
                        onTap: () {
                          context
                              .read<ConversationController>()
                              .addConversation(user);
                          context.pop();
                        },
                        title: Text(user),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
