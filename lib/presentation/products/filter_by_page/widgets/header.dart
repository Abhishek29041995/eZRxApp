part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _Header extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const _Header({required this.materialFilterType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10.0, right: 10.0),
      title: Text(
        _title(context),
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: ZPColors.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
      leading: IconButton(
        key: WidgetKeys.backButton,
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ZPColors.primary,
          size: 15,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.close_outlined,
          color: ZPColors.primary,
          size: 24,
        ),
      ),
    );
  }

  String _title(BuildContext context) {
    if (materialFilterType == MaterialFilterType.countryList) {
      return context.tr('Country of origin');
    }
    if (materialFilterType == MaterialFilterType.manufactured) {
      return context.tr(
        context.read<EligibilityBloc>().state.productManufacturerFilterTitle,
      );
    }

    return '';
  }
}
