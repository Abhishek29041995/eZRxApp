import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_detail.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/tab_view_with_dynamic_height.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/order_history_invoice_tab.dart';
import 'package:flutter/material.dart';

class ViewByDetailPage extends StatefulWidget {
  final Widget header;
  final Widget orderItemHistoryTab;
  final InvoiceDetailResponse invoiceDetailResponse;
  final bool isInvoiceLoading;
  final VoidCallback onLoadMoreInvoices;
  final int totalOrderItemsDisplay;
  final List<LineNumber> lineNumberSelected;
  const ViewByDetailPage({
    super.key,
    required this.isInvoiceLoading,
    required this.header,
    required this.orderItemHistoryTab,
    required this.invoiceDetailResponse,
    required this.onLoadMoreInvoices,
    this.totalOrderItemsDisplay = 0,
    this.lineNumberSelected = const <LineNumber>[],
  });

  @override
  State<ViewByDetailPage> createState() => _ViewByDetailPageState();
}

class _ViewByDetailPageState extends State<ViewByDetailPage> {
  bool _isInvoicesTab = false;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(
      _onInvoiceLoadMore,
    );
    super.initState();
  }

  void _onInvoiceLoadMore() {
    if (_isInvoicesTab) {
      if ((_controller.position.pixels >=
              _controller.position.maxScrollExtent) &&
          widget.invoiceDetailResponse.invoiceDetails.isNotEmpty) {
        widget.onLoadMoreInvoices();
      }
    }
  }

  @override
  void dispose() {
    if (_controller.hasClients) {
      _controller.removeListener(_onInvoiceLoadMore);
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnouncementBanner(
      currentPath: context.router.currentPath,
      child: ListView(
        key: WidgetKeys.scrollList,
        controller: _controller,
        children: [
          widget.header,
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: TabViewWithDynamicHeight(
              onTabChanged: (isInvoicesTab) {
                _isInvoicesTab = isInvoicesTab;
              },
              tabs: [
                Tab(
                  key: WidgetKeys.orderItemHistoryItemTab,
                  text:
                      '${context.tr('Your items')} ${widget.totalOrderItemsDisplay > 0 ? '(${widget.totalOrderItemsDisplay})' : ''}',
                ),
                Tab(
                  key: WidgetKeys.orderItemHistoryInvoiceTab,
                  text:
                      '${context.tr('Invoices')} (${widget.invoiceDetailResponse.invoiceCount})',
                ),
              ],
              tabViews: [
                widget.orderItemHistoryTab,
                OrderHistoryInvoiceTab(
                  invoices: widget.invoiceDetailResponse.invoiceDetails,
                  isLoading: widget.isInvoiceLoading,
                  controller: _controller,
                  lineNumberSelected: widget.lineNumberSelected,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
