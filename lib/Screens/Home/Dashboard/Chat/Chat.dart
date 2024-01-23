import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ChatScreen.dart';
class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: ChatListScreen(),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

class ChatListScreen extends StatelessWidget {
  final List<String> _userNames = ['Hamza', 'Faizan', 'Haram', 'Ahmed', 'Nouman','Rehan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _userNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: 
            Padding(padding: EdgeInsets.all(5),child:Container(
              child: Row(children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/user.png'),
                ),
                Column(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child:Text(_userNames[index],style: TextStyle(fontFamily: 'Itim',fontSize: 15,fontWeight: FontWeight.w500),) ,)
                    ,],)
                
              ]),
            ),
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(                          
              MaterialPageRoute(builder: (context) => ChatDetailScreen(userName: _userNames[index])));
            }
          );
        },
      ),
    );
  }
}

