part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _ContactUsForm extends StatelessWidget {
  const _ContactUsForm();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsBloc, ContactUsState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () async {
            if (state.responseFlag) {
              await context.router.maybePop().then(
                    (value) => CustomSnackBar(
                      key: WidgetKeys.messageReceivedKey,
                      messageText: context.tr('Message has been received.'),
                    ).show(context),
                  );
            } else {
              await CustomSnackBar(
                key: WidgetKeys.messageNotReceivedKey,
                messageText: context.tr('Message has not been received.'),
                backgroundColor: ZPColors.error,
                icon: const Icon(
                  Icons.error_outline,
                  color: ZPColors.black,
                ),
              ).show(context);
            }
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessage
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: const Column(
            children: [
              _UsernameTextField(),
              SizedBox(
                height: padding24,
              ),
              _ContactNumberTextField(),
              SizedBox(
                height: padding24,
              ),
              _EmailTextField(),
              SizedBox(
                height: padding24,
              ),
              _MessageTextField(),
              SizedBox(
                height: padding24,
              ),
              _SendMessageButton(),
            ],
          ),
        );
      },
    );
  }
}
