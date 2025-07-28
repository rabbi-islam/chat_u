part of 'conversation_bloc.dart';

@immutable
sealed class ConversationState {}

final class ConversationInitial extends ConversationState {}

final class ConversationLoading extends ConversationState {}

final class ConversationLoaded extends ConversationState {
  final List<ConversationEntity> conversation;
  ConversationLoaded(this.conversation);
}

final class ConversationLoadingFailed extends ConversationState {
  final String errorMessage;
  ConversationLoadingFailed(this.errorMessage);
}
