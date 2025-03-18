import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/chatbot/repository/i_chatbot_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';
part 'chat_bot_bloc.freezed.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  final IChatBotRepository chatBotRepository;
  StreamSubscription? _deepLinkHandlerStreamSubscription;

  ChatBotBloc({
    required this.chatBotRepository,
  }) : super(ChatBotState.initial()) {
    on<ChatBotEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ChatBotEvent event,
    Emitter<ChatBotState> emit,
  ) async {
    await event.map(
      initialize: (_) {
        _deepLinkHandlerStreamSubscription?.cancel;
        _deepLinkHandlerStreamSubscription =
            chatBotRepository.processDeepLinkOnIncomingEvent();
        emit(ChatBotState.initial());
      },
      startChatbot: (_) async {
        emit(
          state.copyWith(
            isLoading: true,
            chatbotFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await chatBotRepository.startChatbot();
        if (isClosed) return;
        failureOrSuccess.fold(
          (error) => emit(
            state.copyWith(
              isLoading: false,
              chatbotFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (_) {
            emit(
              state.copyWith(
                isLoading: false,
              ),
            );
          },
        );
      },
      resetChatbot: (_) async {
        emit(
          state.copyWith(
            isLoading: true,
            chatbotFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await chatBotRepository.resetChatbot();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              chatbotFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (_) => emit(
            state.copyWith(
              isLoading: false,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _deepLinkHandlerStreamSubscription?.cancel();

    return super.close();
  }
}
