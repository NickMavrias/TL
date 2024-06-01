import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live μηνύματα'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 20, // example number of messages
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('User ${index + 1}'),
                subtitle: Text('This is message ${index + 1}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
