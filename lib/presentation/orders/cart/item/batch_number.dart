//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
// import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
// import 'package:ezrxmobile/presentation/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: dangling_library_doc_comments
/// TODO: Will be used while implementing Batch Number selection

// class BatchNumberLabel extends StatelessWidget {
//   final CartItem cartItem;
//   final bool isOrderSummaryView;
//   const BatchNumberLabel({
//     Key? key,
//     required this.cartItem,
//     required this.isOrderSummaryView,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final material = cartItem.materials.first;
//     if (!material.salesOrgConfig.enableBatchNumber) {
//       return const SizedBox.shrink();
//     }

//     return InkWell(
//       key:
//           Key('batchNumber${material.getMaterialNumber.getOrDefaultValue('')}'),
//       onTap: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           context: context,
//           builder: (_) {
//             return _BatchActionSheet(
//               item: cartItem,
//             );
//           },
//         );
//       },
//       child: Text(
//         '${'Batch Number : '.tr()}${material.stockInfo.batch.selectOrGetBatch}',
//         key: ValueKey(
//           'batchNumber_${material.stockInfo.batch.selectOrGetBatch}',
//         ),
//         style: Theme.of(context).textTheme.titleSmall?.copyWith(
//               decoration: TextDecoration.underline,
//               decorationThickness: 2,
//               backgroundColor: ZPColors.extraLightGray,
//               color: !material.stockInfo.batch.isValid()
//                   ? ZPColors.error
//                   : ZPColors.black,
//             ),
//       ),
//     );
//   }
// }

// class _BatchActionSheet extends StatelessWidget {
//   final CartItem item;
//   const _BatchActionSheet({
//     Key? key,
//     required this.item,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         AppBar(
//           key: const ValueKey('selectBatchNumber'),
//           title: const Text(
//             'Select Batch Number',
//           ).tr(),
//           automaticallyImplyLeading: false,
//           actions: [
//             IconButton(
//               key: const Key('closeButton'),
//               onPressed: () => Navigator.of(context).pop(),
//               icon: const Icon(
//                 Icons.clear,
//                 color: ZPColors.black,
//               ),
//             ),
//           ],
//         ),
//         SafeArea(
//           child: item.materials.first.batchNumbers.isNotEmpty
//               ? Column(
//                   children: item.materials.first.stockInfoList.map(
//                     (StockInfo stockInfo) {
//                       return RadioListTile<StockInfo>(
//                         key: ValueKey(
//                           stockInfo.batch.getOrDefaultValue(''),
//                         ),
//                         title: Text(
//                           stockInfo.batch.getOrDefaultValue(''),
//                           key: const Key('selectBatchNumberRadioListTile'),
//                         ),
//                         groupValue: item.materials.first.stockInfo,
//                         controlAffinity: ListTileControlAffinity.trailing,
//                         onChanged: (StockInfo? value) {
//                           context.read<CartBloc>().add(
//                                 CartEvent.updateBatchInCartItem(
//                                   item: item,
//                                   stockInfo: stockInfo,
//                                 ),
//                               );
//                           context.router.pop();
//                         },
//                         value: stockInfo,
//                       );
//                     },
//                   ).toList(),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     'No batch found',
//                     key: const Key('noBatchFound'),
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ).tr(),
//                 ),
//         ),
//       ],
//     );
//   }
// }
