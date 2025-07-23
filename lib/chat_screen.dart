import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatar.iran.liara.run/public/23',
              ),
            ),
            SizedBox(width: 10,),
            Text(
                'Rabbi Islam',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                _buildReceiveMessage(context, "Hello, Buddy"),
                _buildSenderMessage(context, "Hey, buddy, whats up?"),
                _buildSenderMessage(context, "How are you doing?"),
                _buildReceiveMessage(context, "Great! 🙂"),
                _buildReceiveMessage(context, "What about you?"),
              ],
            ),
          ),
          _buildMessageInput()
        ],
      )
    );
  }

  Widget _buildReceiveMessage(BuildContext context, String message){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultsColor.receiverMessage,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );

  }
  Widget _buildSenderMessage(BuildContext context, String message){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 10,top: 5,bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: DefaultsColor.senderMessage,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );

  }
  Widget _buildMessageInput(){
    return Container(
      decoration: BoxDecoration(
        color: DefaultsColor.sendMessageInput,
        borderRadius: BorderRadius.circular(25)
      ),
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){},
            child: Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none
                ),
                style: TextStyle(color: Colors.white),
              )
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){},
            child: Icon(
              Icons.send,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}















