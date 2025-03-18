import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/chatbot/chatbot_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class ChatBotBlocMock extends MockBloc<ChatBotEvent, ChatBotState>
    implements ChatBotBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ChatBotBloc chatBotBlocMock;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    chatBotBlocMock = ChatBotBlocMock();
    when(() => chatBotBlocMock.state).thenReturn(
      ChatBotState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ChatBotBloc>(
          create: (context) => chatBotBlocMock,
        ),
      ],
      child: const MaterialApp(
        home: Stack(
          children: [
            ChatBotWidget(),
          ],
        ),
      ),
    );
  }

  group(
    'ChatBot Widget Test',
    () {
      testWidgets(
        ' => Chat bot Button loading',
        (WidgetTester tester) async {
          whenListen(
            chatBotBlocMock,
            Stream.fromIterable([
              ChatBotState.initial().copyWith(
                isLoading: true,
              ),
            ]),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          //chatbot button Loading
          expect(
            find.byType(LoadingShimmer),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        ' => verify chat bot Button and onPressed',
        (WidgetTester tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final chatBotFloatingActionButton =
              find.byKey(WidgetKeys.chatBotFloatingActionButton);

          //chatbot button visible
          expect(
            chatBotFloatingActionButton,
            findsOneWidget,
          );
          //chatbot button tapped
          await tester.tap(chatBotFloatingActionButton);
          verify(
            () => chatBotBlocMock.add(const ChatBotEvent.startChatbot()),
          ).called(1);
        },
      );
    },
  );
}
