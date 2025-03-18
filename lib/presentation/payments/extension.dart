import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension PaymentBuildContext on BuildContext {
  PaymentInProgressBloc paymentInProgressBloc(bool isMarketPlace) =>
      isMarketPlace
          ? read<MPPaymentInProgressBloc>()
          : read<ZPPaymentInProgressBloc>();

  AccountSummaryBloc accountSummaryBloc(bool isMarketPlace) => isMarketPlace
      ? read<MPAccountSummaryBloc>()
      : read<ZPAccountSummaryBloc>();

  SoaBloc soaBloc(bool isMarketPlace) =>
      isMarketPlace ? read<MPSoaBloc>() : read<ZPSoaBloc>();

  AllInvoicesBloc allInvoicesBloc(bool isMarketPlace) =>
      isMarketPlace ? read<MPAllInvoicesBloc>() : read<ZPAllInvoicesBloc>();

  AllCreditsBloc allCreditsBloc(bool isMarketPlace) =>
      isMarketPlace ? read<MPAllCreditsBloc>() : read<ZPAllCreditsBloc>();

  FullSummaryBloc fullSummaryBloc(bool isMarketPlace) =>
      isMarketPlace ? read<MPFullSummaryBloc>() : read<ZPFullSummaryBloc>();

  PaymentSummaryBloc paymentSummaryBloc(bool isMarketPlace) => isMarketPlace
      ? read<MPPaymentSummaryBloc>()
      : read<ZPPaymentSummaryBloc>();

  bool get isMPPayment => PaymentModule.of(this).isMarketPlace;
}
