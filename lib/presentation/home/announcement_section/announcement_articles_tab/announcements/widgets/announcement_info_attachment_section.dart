part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';

class _AnnouncementInfoAttachmentSection extends StatelessWidget {
  final List<Attachment> documentList;
  const _AnnouncementInfoAttachmentSection({
    required this.documentList,
  });

  @override
  Widget build(BuildContext context) {
    return documentList.isNotEmpty
        ? BlocProvider(
            create: (context) => locator<AnnouncementAttachmentBloc>(),
            child: BlocListener<AnnouncementAttachmentBloc,
                AnnouncementAttachmentState>(
              listenWhen: (previous, current) =>
                  previous.isDownloading != current.isDownloading,
              listener: (context, state) => state.failureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) => CustomSnackBar(
                    messageText: context.tr('File downloaded successfully'),
                  ).show(context),
                ),
              ),
              child: Column(
                children:
                    documentList.map((e) => _AttachmentCard(url: e)).toList(),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _AttachmentCard extends StatelessWidget {
  final Attachment url;
  const _AttachmentCard({required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<AnnouncementAttachmentBloc>()
          .add(AnnouncementAttachmentEvent.downloadFile(url: url)),
      child: Card(
        color: ZPColors.extraLightGrey3,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SvgPicture.asset(
                  url.getSvgIconForFileType,
                ),
              ),
              Text(
                url.getFileNameFromPath,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
