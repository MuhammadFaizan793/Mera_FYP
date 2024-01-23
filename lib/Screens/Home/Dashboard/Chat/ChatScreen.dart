import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatDetailScreen extends StatefulWidget {
  final String userName;

  ChatDetailScreen({required this.userName});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}
class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();

    setState(() {
      _messages.insert(0, ChatMessage(text: text, isMe: true));
      // Simulating a reply from another user
      _messages.insert(0, ChatMessage(text: 'Hello!', isMe: false));
    });
  }

  Widget _buildMessage(ChatMessage message) {
    return Container(
      margin: message.isMe ?EdgeInsets.fromLTRB(230,10,20,10) :EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0) ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(message.isMe ? 'Me' : 'You'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.isMe ? 'You' : widget.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(message.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        reverse: true,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return _buildMessage(_messages[index]);
        },
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
                
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Row(children: [
          Image.asset('assets/images/user.png',width: 30,height: 30,),
          Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child:Text(widget.userName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),) ,)
          
        ],)),

      ),
      body: 
      Column(
        children: [
          _buildMessageList(),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}
 