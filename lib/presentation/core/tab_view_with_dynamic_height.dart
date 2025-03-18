import 'package:flutter/material.dart';

class TabViewWithDynamicHeight extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final Function(bool isInvoicesTab) onTabChanged;
  const TabViewWithDynamicHeight({
    super.key,
    required this.tabs,
    required this.tabViews,
    required this.onTabChanged,
  })  : assert(tabs.length > 0),
        assert(tabs.length == tabViews.length);

  @override
  State<TabViewWithDynamicHeight> createState() =>
      _TabViewWithDynamicHeightState();
}

class _TabViewWithDynamicHeightState extends State<TabViewWithDynamicHeight>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      widget.onTabChanged(_tabController.index == widget.tabs.length - 1);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: _tabController,
          tabs: widget.tabs,
        ),
        Center(
          child: widget.tabViews[_tabController.index],
        ),
      ],
    );
  }
}
