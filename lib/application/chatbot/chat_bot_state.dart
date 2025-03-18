part of 'chat_bot_bloc.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const ChatBotState._();

  const factory ChatBotState({
    required bool isLoading,
    required Option<Either<ApiFailure, dynamic>> chatbotFailureOrSuccessOption,
  }) = _ChatBotState;

  factory ChatBotState.initial() => ChatBotState(
        isLoading: false,
        chatbotFailureOrSuccessOption: none(),
      );
}
