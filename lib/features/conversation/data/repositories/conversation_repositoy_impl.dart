import 'package:chat_u/features/conversation/data/datasources/conversation_remote_data_source.dart';
import 'package:chat_u/features/conversation/domain/entities/conversation_entity.dart';
import 'package:chat_u/features/conversation/domain/repositories/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository{

  final ConversationRemoteDataSource dataSource;

  ConversationRepositoryImpl({ required this.dataSource});

  @override
  Future<List<ConversationEntity>> fetchConversation() async {
    return await dataSource.fetchConversation();

  }
}