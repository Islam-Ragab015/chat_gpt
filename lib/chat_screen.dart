import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _user = ChatUser(id: '1', firstName: 'You');
  final _bot = ChatUser(id: '2', firstName: 'Broxi');
  final List<ChatMessage> messages = [];
  final _chatGpt = OpenAI.instance.build(
    token: 'your api token',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat with Broxi"),
        backgroundColor: Colors.deepPurple,
        elevation: 5,
      ),
      body: DashChat(
        currentUser: _user,
        onSend: onSend,
        messages: messages,
      ),
    );
  }

  void onSend(ChatMessage message) async {
    setState(() => messages.insert(0, message));
    final history = messages.map((msg) {
      return {
        'role': msg.user == _user ? 'user' : 'assistant',
        'content': msg.text
      };
    }).toList();

    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: history,
      maxToken: 200,
    );

    final response = await _chatGpt.onChatCompletion(request: request);
    response?.choices.forEach((choice) {
      if (choice.message != null) {
        setState(() {
          messages.insert(
            0,
            ChatMessage(
              text: choice.message!.content,
              user: _bot,
              createdAt: DateTime.now(),
            ),
          );
        });
      }
    });
  }
}
