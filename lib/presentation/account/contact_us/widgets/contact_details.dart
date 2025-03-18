part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _ContactDetails extends StatelessWidget {
  const _ContactDetails({super.key});

  final contactText = 'Have any questions? we\'d love to hear from you.';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsDetailsBloc, ContactUsDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final email = context.read<EligibilityBloc>().state.salesOrg.isValid()
            ? state.contactUsDetails.postloginSendToEmail
            : state.contactUsDetails.preloginSendToEmail;

        return state.isLoading
            ? LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              )
            : Column(
                children: [
                  Html(
                    key: WidgetKeys.contactDetailsSectionKey,
                    style: {
                      'body': Style(
                        padding: HtmlPaddings.all(0),
                        margin: Margins.all(0),
                      ),
                    },
                    data: state.contactUsDetails.content
                        .appendedImgSrcWithBaseUrlWithMedia,
                    shrinkWrap: true,
                  ),
                  _ContactItem(
                    key: WidgetKeys.genericKey(
                      key: email,
                    ),
                    label: email,
                    icon: Icons.mail_outline,
                    onTap: () => _sendEmail(
                      email,
                      context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrg
                          .contactPersonName,
                    ),
                  ),
                ],
              );
      },
    );
  }

  Future<void> _sendEmail(String email, String personName) async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Example Subject & Symbols are allowed!',
        'body': 'Dear $personName',
      },
    );
    await launchUrl(emailLaunchUri);
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(padding6),
      onTap: () => onTap(),
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: ZPColors.extraDarkGreen,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
