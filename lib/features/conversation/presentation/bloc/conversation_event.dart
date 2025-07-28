part of 'conversation_bloc.dart';

@immutable
sealed class ConversationEvent {}

class FetchConversation extends ConversationEvent{}
