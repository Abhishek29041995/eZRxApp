import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

class ErrorUtils {
  static void handleApiFailure(BuildContext context, ApiFailure failure) {
    final isTokenExpiredFailure =
        failure == const ApiFailure.authenticationFailed();
    final message = context.tr(
      failure.failureMessage.message,
      namedArgs: failure.failureMessage.arguments,
    );
    CustomSnackBar(
      icon: const Icon(
        Icons.info,
        color: ZPColors.error,
      ),
      backgroundColor: ZPColors.errorSnackBarColor,
      messageText: message,
    ).show(context);
    if (isTokenExpiredFailure) {
      context.read<AuthBloc>().add(const AuthEvent.logout());
    }
  }

  static void handleCartApiFailure(BuildContext context, ApiFailure failure) {
    if (failure == const ApiFailure.addAnimalHealthWithNormalProductToCart()) {
      return;
    }
    handleApiFailure(context, failure);
  }

  static void handleStockInfoApiFailure(
    BuildContext context,
    ApiFailure failure,
  ) {
    if (failure == const ApiFailure.stockInfoNotAvailable()) {
      return;
    }
    handleApiFailure(context, failure);
  }
}
