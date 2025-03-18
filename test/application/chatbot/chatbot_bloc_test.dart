import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ChatBotRepositoryMock extends Mock implements ChatBotRepository {}

void main() {
  final chatBotRepositoryMock = ChatBotRepositoryMock();

  group('Chatbot Bloc', () {
    blocTest(
      'Initialize',
      build: () => ChatBotBloc(chatBotRepository: chatBotRepositoryMock),
      setUp: () {
        when(() => chatBotRepositoryMock.processDeepLinkOnIncomingEvent())
            .thenReturn(const Stream.empty().listen((event) {}));
      },
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.initialize()),
      expect: () => [ChatBotState.initial()],
    );

    blocTest(
      'Start chat bot success',
      build: () => ChatBotBloc(chatBotRepository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.startChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.startChatbot()).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      expect: () => [
        ChatBotState.initial().copyWith(isLoading: true),
        ChatBotState.initial(),
      ],
    );

    blocTest(
      'Start chat bot failure',
      build: () => ChatBotBloc(chatBotRepository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.startChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.startChatbot()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Repo error')),
        );
      },
      expect: () => [
        ChatBotState.initial().copyWith(isLoading: true),
        ChatBotState.initial().copyWith(
          isLoading: false,
          chatbotFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Repo error'))),
        ),
      ],
    );

    blocTest(
      'Reset chat bot success',
      build: () => ChatBotBloc(chatBotRepository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.resetChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.resetChatbot()).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      expect: () => [
        ChatBotState.initial().copyWith(isLoading: true),
        ChatBotState.initial(),
      ],
    );

    blocTest(
      'Reset chat bot failure',
      build: () => ChatBotBloc(chatBotRepository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.resetChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.resetChatbot()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Repo error')),
        );
      },
      expect: () => [
        ChatBotState.initial().copyWith(isLoading: true),
        ChatBotState.initial().copyWith(
          isLoading: false,
          chatbotFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Repo error'))),
        ),
      ],
    );
  });
}
