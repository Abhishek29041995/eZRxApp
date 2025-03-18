part of 'chat_bot_bloc.dart';

@freezed
class ChatBotEvent with _$ChatBotEvent {
  const factory ChatBotEvent.initialize() = _Initialize;
  const factory ChatBotEvent.startChatbot() = _StartChatbot;
  const factory ChatBotEvent.resetChatbot() = _ResetChatbot;
}
