import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Recent', style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact('Rabbi', context),
                _buildRecentContact('Rashed', context),
                _buildRecentContact('Rabbi', context),
                _buildRecentContact('Rashed', context),
                _buildRecentContact('Rabbi', context),
                _buildRecentContact('Rabbi', context),
                _buildRecentContact('Rashed', context),
                _buildRecentContact('Rabbi', context),
                _buildRecentContact('Rashed', context),
                _buildRecentContact('Rabbi', context),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: DefaultsColor.messageListPage,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  )
                ),
                child: ListView(
                  children: [
                    _buildMessageTile("Rabbi Islam", "Hey! buddy", "05.20"),
                    _buildMessageTile("Masum Biswash", "Hello mama, ki korish?", "04.20"),
                    _buildMessageTile("Sajjad Hossain Sabbir SP", "Bhai ki koro?", "02.13"),
                    _buildMessageTile("Joy", "Hey! buddy", "05.20"),
                    _buildMessageTile("Muhammad Mijan", "Hey! buddy", "05.20"),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://avatar.iran.liara.run/public/23',
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://avatar.iran.liara.run/public/23',
            ),
          ),
          const SizedBox(height: 5),
          Text(name, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
