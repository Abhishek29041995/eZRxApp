import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class AnnouncementBottomSheet extends StatelessWidget {
  const AnnouncementBottomSheet({
    super.key,
    required this.maintenanceItem,
    required this.storageType,
  });
  final MaintenanceItem maintenanceItem;
  final StorageType storageType;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.announcementBottomSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                SvgImage.iconAlert,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.tr('Alert'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
            _ListViewAnnouncement(
              banners: maintenanceItem.getListByType(storageType),
            ),
            const SizedBox(height: 24),
            _ButtonClose(storageType: storageType),
          ],
        ),
      ),
    );
  }
}

class _ListViewAnnouncement extends StatelessWidget {
  const _ListViewAnnouncement({
    required this.banners,
  });
  final List<MaintenanceBanner> banners;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 45.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return _ItemBanner(
            banner: banners[i],
          );
        },
        separatorBuilder: (context, _) {
          return const Divider(
            endIndent: 1,
            indent: 1,
            thickness: 1,
            color: ZPColors.lightGray,
          );
        },
        itemCount: banners.length,
      ),
    );
  }
}

class _ItemBanner extends StatelessWidget {
  const _ItemBanner({
    required this.banner,
  });
  final MaintenanceBanner banner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (banner.hyperlink.isInternalLink) {
          context.read<DeepLinkingBloc>().add(
                DeepLinkingEvent.addPendingLink(
                  EzrxLink(banner.hyperlink.getOrDefaultValue('')),
                ),
              );
        } else if (banner.hyperlink.isExternalLink) {
          context.router.push(
            WebViewPageRoute(
              url: banner.hyperlink.getOrDefaultValue(''),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Html(
                data: banner.content,
                style: {
                  'body': Style(
                    padding: HtmlPaddings.zero,
                    margin: Margins.zero,
                  ),
                },
              ),
            ),
            if (banner.hyperlink.isInternalLink ||
                banner.hyperlink.isExternalLink)
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 24,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ButtonClose extends StatelessWidget {
  const _ButtonClose({
    required this.storageType,
  });

  final StorageType storageType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            key: WidgetKeys.closeAlertDialog,
            onPressed: () {
              context.read<AnnouncementBloc>().add(
                    AnnouncementEvent.setClosedTime(
                      dateTime: DateTimeStringValue(
                        DateTime.now()
                            .add(const Duration(days: 1))
                            .toIso8601String(),
                      ),
                      storageType: storageType,
                    ),
                  );
              context.maybePop();
            },
            child: Text(
              'Close'.tr(),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
