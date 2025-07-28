import 'package:bloc/bloc.dart';
import 'package:chat_u/features/conversation/domain/entities/conversation_entity.dart';
import 'package:chat_u/features/conversation/domain/usecases/fetch_conversation_use_case.dart';
import 'package:meta/meta.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  FetchConversationUseCase fetchConversationUseCase;
  ConversationBloc(this.fetchConversationUseCase) : super(ConversationInitial()) {

    on<FetchConversation>((event, emit) async {
      emit(ConversationLoading());
      try{
        final conversations = await fetchConversationUseCase.call();
        emit(ConversationLoaded(conversations));
      }
      catch(error){
        emit(ConversationLoadingFailed('error: $error'));
      }
    });
  }
}







