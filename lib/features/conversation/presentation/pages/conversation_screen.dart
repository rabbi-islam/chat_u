import 'package:chat_u/features/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

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
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultsColor.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: BlocBuilder<ConversationBloc, ConversationState>(
                builder: (context, state) {
                  if(state is ConversationLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(state is ConversationLoaded){
                    return ListView.builder(
                        itemCount: state.conversation.length,
                        itemBuilder: (context, index){
                          final conversations = state.conversation[index];
                          return _buildMessageTile(
                              conversations.participantName,
                              conversations.lastMessage,
                              conversations.lastMessageTime.toString()
                          );
                        }
                    );
                  }else if(state is ConversationLoadingFailed){
                    return Center(child: Text(state.errorMessage),);
                  }else{
                    return Center(child: Text('No conversations found'),);
                  }

                },
              ),
            ),
          ),
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
      trailing: Text(time, style: TextStyle(color: Colors.grey)),
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
