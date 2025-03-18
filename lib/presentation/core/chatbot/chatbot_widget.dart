import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBotWidget extends StatelessWidget {
  const ChatBotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: size.height * 0.1,
      right: size.width * 0.04,
      child: BlocBuilder<ChatBotBloc, ChatBotState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return LoadingShimmer.withChild(
            enabled: state.isLoading,
            child: FloatingActionButton(
              key: WidgetKeys.chatBotFloatingActionButton,
              onPressed: () => context
                  .read<ChatBotBloc>()
                  .add(const ChatBotEvent.startChatbot()),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: ZPColors.primary,
                child: SvgPicture.asset(
                  SvgImage.ezrxPlusLogoWhite,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
