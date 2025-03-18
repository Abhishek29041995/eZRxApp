part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSearchSection extends StatefulWidget {
  final String parentRoute;
  final SearchKey initSearchValue;

  const _ProductSearchSection({
    required this.parentRoute,
    required this.initSearchValue,
  });

  @override
  State<_ProductSearchSection> createState() => _ProductSearchSectionState();
}

class _ProductSearchSectionState extends State<_ProductSearchSection> {
  late ProductSearchBloc _productSearchBloc;
  SearchKey _searchKey = SearchKey.empty();
  @override
  void initState() {
    super.initState();
    _productSearchBloc = context.read<ProductSearchBloc>();
    _searchKey = widget.initSearchValue;
  }

  @override
  void didUpdateWidget(_ProductSearchSection oldWidget) {
    if (oldWidget.initSearchValue != widget.initSearchValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchKey = widget.initSearchValue;
        setState(() {});
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _productSearchBloc.add(
      const ProductSearchEvent.clearSearch(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: ZPColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ZPColors.inputBorderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchBar(
              key: WidgetKeys.genericKey(
                key: _searchKey.searchValueOrEmpty,
              ),
              autofocus: true,
              initialValue: _searchKey.searchValueOrEmpty,
              enabled: true,
              onSearchChanged: (value) {
                _trackMixPanelSearchEvent(value);
                context.read<ProductSearchBloc>().add(
                      ProductSearchEvent.searchProduct(
                        searchKey: SearchKey.search(value),
                        materialFilter: context
                            .read<MaterialFilterBloc>()
                            .state
                            .materialFilter,
                      ),
                    );
              },
              onSearchSubmitted: (value) {
                _trackMixPanelSearchEvent(value);
                _trackCleverTapSearchEvent(value);
                context.read<ProductSearchBloc>().add(
                      ProductSearchEvent.saveSearchHistory(
                        searchKey: SearchKey.search(value),
                      ),
                    );
                context.router.navigateNamed('/main/products');
                context.read<MaterialListBloc>()
                  ..add(
                    MaterialListEvent.updateSearchKey(
                      searchKey: value,
                    ),
                  )
                  ..add(
                    MaterialListEvent.fetch(
                      selectedMaterialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .materialFilter,
                    ),
                  );
              },
              //customValidator : we are not taking the value from the state, as there is auto-search.
              //It take time for 1 sec to emit the state, so we have used from local.
              customValidator: (value) => SearchKey.search(value).isValid(),
              disableBorder: true,
              backgroundColor: ZPColors.transparent,
              onClear: () => context.read<ProductSearchBloc>().add(
                    const ProductSearchEvent.clearSearch(),
                  ),
              searchSuffixIcon: const SizedBox.shrink(),
            ),
          ),
          const ScanCameraButton(),
        ],
      ),
    );
  }

  void _trackMixPanelSearchEvent(String keyword) {
    trackMixpanelEvent(
      TrackingEvents.productSearch,
      props: {
        TrackingProps.searchKeyword: keyword,
        TrackingProps.searchFrom:
            RouterUtils.buildRouteTrackingName(widget.parentRoute),
      },
    );
  }

  void _trackCleverTapSearchEvent(String keyword) {
    trackClevertapEvent(
      TrackingEvents.productSearch,
      props: {
        TrackingProps.searchKeyword: keyword,
        TrackingProps.searchFrom:
            RouterUtils.buildRouteTrackingName(widget.parentRoute),
        TrackingProps.searchMethod: 'user typed',
        TrackingProps.market: context
            .read<ProductSearchBloc>()
            .state
            .salesOrganization
            .salesOrg
            .country,
      },
    );
  }
}
