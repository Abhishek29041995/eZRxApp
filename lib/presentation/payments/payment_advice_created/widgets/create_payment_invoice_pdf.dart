import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:typed_data';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';

class CreatePaymentInvoicePdf {
  pw.TextStyle get extraSmallPwTextStyle => const pw.TextStyle(
        fontSize: 10,
        letterSpacing: 0.25,
      );

  pw.TextStyle get smallPwTextStyle => extraSmallPwTextStyle.copyWith(
        fontSize: 12,
      );

  pw.TextStyle get mediumPwTextStyle => extraSmallPwTextStyle.copyWith(
        fontSize: 14,
      );

  pw.TextStyle get largePwTextStyle => extraSmallPwTextStyle.copyWith(
        fontSize: 16,
      );

  DateTimeStringValue expiryDate({
    required DateTimeStringValue valueDate,
    required int expiryDays,
  }) {
    if (valueDate.isEmpty) {
      return DateTimeStringValue('');
    }

    return DateTimeStringValue(
      DateFormat(DateTimeFormatString.apiDateWithDashFormat).format(
        DateTime.parse(valueDate.getValue()).add(Duration(days: expiryDays)),
      ),
    );
  }

  Future<pw.MemoryImage> _captureImageDescription({
    required String pleaseNote,
  }) async {
    final imageData = await ScreenshotController().captureFromWidget(
      MediaQuery(
        data: MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single,
        ),
        child: Html(
          data: pleaseNote,
          style: {
            '*': Style(
              fontSize: FontSize(10),
              color: ZPColors.neutralsGrey1,
              lineHeight: const LineHeight(1.5),
            ),
          },
        ),
      ),
    );

    return pw.MemoryImage(imageData);
  }

  pw.TableRow _invoiceItem(
    List<String> cells, {
    bool isHeader = false,
  }) =>
      pw.TableRow(
        decoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(
              width: 2,
              color: PdfColor.fromInt(ZPColors.extraLightGrey3.value),
            ),
          ),
        ),
        children: cells
            .map(
              (cell) => pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 8.0),
                child: pw.Text(
                  cell,
                  style: isHeader
                      ? mediumPwTextStyle.copyWith(
                          color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
                          fontWeight: pw.FontWeight.bold,
                        )
                      : smallPwTextStyle.copyWith(
                          color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
                        ),
                  maxLines: 1,
                  overflow: pw.TextOverflow.clip,
                ),
              ),
            )
            .toList(),
      );

  Future<pw.Widget> _headerInvoice({
    required String headerLogoPath,
    required String zzAdvice,
  }) async {
    final netImage =
        headerLogoPath.isNotEmpty ? await networkImage(headerLogoPath) : null;

    return pw.Container(
      padding: const pw.EdgeInsets.all(16.0),
      decoration: pw.BoxDecoration(
        borderRadius:
            const pw.BorderRadius.vertical(top: pw.Radius.circular(16.0)),
        color: PdfColor.fromInt(ZPColors.primary.value),
      ),
      child: pw.Row(
        children: [
          pw.Flexible(
            flex: 1,
            child: netImage != null ? pw.Image(netImage) : pw.SizedBox.shrink(),
          ),
          pw.SizedBox(width: 16.0),
          pw.Flexible(
            flex: 2,
            child: pw.Text(
              '${'Payment Advice'.tr()} $zzAdvice',
              style: largePwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.white.value),
                fontWeight: pw.FontWeight.bold,
              ),
              overflow: pw.TextOverflow.clip,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _infoCustomerAndAmount({
    required ShipToInfo shipToInfo,
    required String customerName,
    required String payer,
    required List<PaymentItem> paymentItems,
    required PaymentDue paymentDue,
  }) =>
      pw.Stack(
        alignment: pw.Alignment.center,
        children: [
          pw.SizedBox(
            height: 120,
            width: double.infinity,
            child: pw.Column(
              children: [
                pw.Expanded(
                  child: pw.Container(
                    color: PdfColor.fromInt(ZPColors.primary.value),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    color: PdfColor.fromInt(ZPColors.white.value),
                  ),
                ),
              ],
            ),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(16.0),
            margin: const pw.EdgeInsets.symmetric(horizontal: 16.0),
            decoration: pw.BoxDecoration(
              color: PdfColor.fromInt(ZPColors.white.value),
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(12.0)),
              boxShadow: [
                pw.BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 7,
                  color:
                      PdfColor.fromInt(ZPColors.black.withOpacity(0.5).value),
                ),
              ],
            ),
            child: pw.Row(
              children: [
                _infoCustomer(
                  shipToInfo: shipToInfo,
                  customerName: customerName,
                  payer: payer,
                ),
                pw.VerticalDivider(
                  indent: 0,
                  thickness: 1,
                  endIndent: 0,
                  width: 10,
                  color: PdfColor.fromInt(ZPColors.extraLightGrey3.value),
                ),
                _amountInvoice(
                  paymentItems: paymentItems,
                  paymentDue: paymentDue,
                ),
              ],
            ),
          ),
        ],
      );

  pw.Widget _infoCustomer({
    required ShipToInfo shipToInfo,
    required String customerName,
    required String payer,
  }) =>
      pw.Flexible(
        flex: 5,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              customerName,
              style: largePwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4.0),
            pw.Text(
              shipToInfo.deliveryAddress,
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
              maxLines: 2,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              '${'Customer Code'.tr()}: $payer',
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _amountInvoice({
    required List<PaymentItem> paymentItems,
    required PaymentDue paymentDue,
  }) =>
      pw.Flexible(
        flex: 3,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              '${'Payment Amount'.tr()} (${paymentItems.first.transactionCurrency})',
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              paymentDue.totalAmount,
              style: largePwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _expireInvoice({
    required DateTimeStringValue createdDate,
    required DateTimeStringValue expiryDate,
    required String paymentMethod,
  }) =>
      pw.Table(
        columnWidths: {
          0: const pw.FractionColumnWidth(1 / 3),
          1: const pw.FractionColumnWidth(1 / 3),
          2: const pw.FractionColumnWidth(1 / 3),
        },
        children: [
          pw.TableRow(
            decoration: pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(
                  width: 2,
                  color: PdfColor.fromInt(ZPColors.extraLightGrey3.value),
                ),
              ),
            ),
            children: [
              _dateCreated(createdDate: createdDate),
              _dateExpiry(expiryDate: expiryDate),
              _paymentMethod(paymentMethod: paymentMethod),
            ],
          ),
        ],
      );

  pw.Widget _dateCreated({
    required DateTimeStringValue createdDate,
  }) =>
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0)
            .copyWith(left: 15),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Date created'.tr(),
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              createdDate.dateTimeOrNaString,
              style: largePwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _dateExpiry({
    required DateTimeStringValue expiryDate,
  }) =>
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Payment advice expiry date'.tr(),
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              expiryDate.dateTimeOrNaString,
              style: largePwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _paymentMethod({required String paymentMethod}) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Payment Method'.tr(),
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              paymentMethod,
              style: largePwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _item({
    required List<PaymentItem> paymentItems,
    required SalesOrganisation salesOrganisation,
  }) =>
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 15.0),
        child: pw.Table(
          children: [
            _invoiceItem(
              [
                'Document Date'.tr(),
                if (salesOrganisation.salesOrg.isVN) 'Gov. Number'.tr(),
                'Document Type'.tr(),
                'Document No.'.tr(),
                '${'Amount'.tr()} (${paymentItems.first.transactionCurrency}).',
              ],
              isHeader: true,
            ),
            ...paymentItems.map(
              (e) => _invoiceItem([
                e.documentDate.dateString,
                if (salesOrganisation.salesOrg.isVN) e.documentReferenceID,
                e.postingKeyName,
                e.searchKey,
                e.paymentAmountInDisplayCrcy.toStringAsFixed(2),
              ]),
            ),
          ],
        ),
      );

  Future<pw.Widget> _description({required String pleaseNote}) async {
    if (pleaseNote.isEmpty) return pw.SizedBox.shrink();

    final image = await _captureImageDescription(pleaseNote: pleaseNote);

    return pw.Container(
      width: double.infinity,
      color: PdfColor.fromInt(ZPColors.pdfPleaseNoteBg.value),
      padding: const pw.EdgeInsets.symmetric(vertical: 5.0)
          .copyWith(right: 20, left: -20),
      child: pw.Image(image),
    );
  }

  pw.Widget _footerInvoice({required String footer}) => footer.isNotEmpty
      ? pw.Container(
          padding:
              const pw.EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: pw.BoxDecoration(
            borderRadius: const pw.BorderRadius.vertical(
              bottom: pw.Radius.circular(16.0),
            ),
            color: PdfColor.fromInt(ZPColors.accentColor.value),
          ),
          child: pw.Center(
            child: pw.Text(
              footer,
              style: extraSmallPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.primary.value),
              ),
            ),
          ),
        )
      : pw.SizedBox();

  pw.Widget get _paymentStepsQrCode => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'For QR Code payment'.tr(),
            style: largePwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            '1. Log in to Banking App'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
            ),
          ),
          pw.Text(
            '2. Scan below & Pay'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
            ),
          ),
        ],
      );

  pw.Widget get _paymentStepsBankTransfer => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'For Bank Transfer or UEN Payment'.tr(),
            style: largePwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            '1. Log in to Banking App or Online banking'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
            ),
          ),
          pw.Text(
            '2. Select Bank Account Transfer or UEN payment'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
            ),
          ),
        ],
      );

  pw.Widget get _paymentStepsBankIn => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'For Bank-In Payment'.tr(),
            style: largePwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            '1. Log in to Banking App'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
            ),
          ),
          pw.Text(
            '2. Scan below & Pay'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.primary.value),
            ),
          ),
        ],
      );

  pw.Widget get _paymentSteps => pw.Row(
        children: [
          pw.Flexible(child: _paymentStepsQrCode, flex: 1),
          pw.SizedBox(width: 24),
          pw.Flexible(child: _paymentStepsBankTransfer, flex: 2),
        ],
      );

  pw.Widget _balanceRowText({required String key, required String value}) =>
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 135,
            child: pw.Text(
              key,
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.neutralsGrey1.value),
              ),
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              value,
              style: mediumPwTextStyle.copyWith(
                color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
              ),
              maxLines: 2,
            ),
          ),
        ],
      );

  pw.Widget _qrCodeAndBankInfo({
    required String qrCode,
    required BankBeneficiary bankBeneficiary,
  }) =>
      pw.Row(
        children: [
          pw.Flexible(
            child:
                pw.Image(pw.MemoryImage(const Base64Decoder().convert(qrCode))),
            flex: 1,
          ),
          pw.SizedBox(width: 24),
          pw.Flexible(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _balanceRowText(
                  key: 'Beneficiary\'s Name'.tr(),
                  value: bankBeneficiary.beneficiaryName.displayNAIfEmpty,
                ),
                _balanceRowText(
                  key: 'Bank name'.tr(),
                  value: bankBeneficiary.bankName.displayNAIfEmpty,
                ),
                _balanceRowText(
                  key: 'Branch #'.tr(),
                  value: bankBeneficiary.branch,
                ),
                _balanceRowText(
                  key: 'Bank Code'.tr(),
                  value: bankBeneficiary.bankCode,
                ),
                _balanceRowText(
                  key: 'Bank Account'.tr(),
                  value: bankBeneficiary.bankAccount.displayDashIfEmpty,
                ),
                _balanceRowText(
                  key: 'HSBC Swift Code'.tr(),
                  value: bankBeneficiary.hdbcSwiftCode,
                ),
                _balanceRowText(
                  key: 'Bank Address'.tr(),
                  value: bankBeneficiary.bankAddress,
                ),
                _balanceRowText(
                  key: 'PayNow UEN'.tr(),
                  value: bankBeneficiary.payNowUen,
                ),
              ],
            ),
            flex: 2,
          ),
        ],
      );

  pw.Widget _bankInPaymentInfo({
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
  }) =>
      pw.Container(
        width: double.infinity,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _paymentStepsBankIn,
            pw.SizedBox(height: 10),
            _bankAccountsInformation(
              paymentInvoiceInfoPdf: paymentInvoiceInfoPdf,
            ),
            pw.SizedBox(height: 5),
            _bankInNotes,
          ],
        ),
      );

  pw.Widget _bankAccountsInformation({
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
  }) =>
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Account Information'.tr(),
            style: mediumPwTextStyle.copyWith(
              color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: [
              pw.Expanded(
                child: _bankAccountDetail(
                  bankBeneficiary: paymentInvoiceInfoPdf.firstBankBeneficiary,
                ),
              ),
              _verticalDivider,
              pw.Expanded(
                child: _bankAccountDetail(
                  bankBeneficiary: paymentInvoiceInfoPdf.secondBankBeneficiary,
                ),
              ),
            ],
          ),
        ],
      );

  pw.Widget _bankAccountDetail({
    required BankBeneficiary bankBeneficiary,
  }) =>
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _informationRowText(
            title: 'Bank Name'.tr(),
            value: bankBeneficiary.bankName.displayNAIfEmpty,
          ),
          _informationRowText(
            title: 'Account Number'.tr(),
            value: bankBeneficiary.bankAccount.displayNAIfEmpty,
          ),
          _informationRowText(
            title: 'Account Holder'.tr(),
            value: bankBeneficiary.beneficiaryName.displayNAIfEmpty,
          ),
        ],
      );

  pw.Widget _informationRowText({
    required String title,
    required String value,
  }) =>
      pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 8),
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              width: 120,
              child: pw.Text(
                title,
                style: mediumPwTextStyle.copyWith(
                  color: PdfColor.fromInt(ZPColors.neutralsGrey1.value),
                ),
              ),
            ),
            pw.Expanded(
              child: pw.Text(
                value,
                style: mediumPwTextStyle.copyWith(
                  color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      );

  pw.Widget get _verticalDivider => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 15),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              width: 1,
              height: 35,
              color: PdfColor.fromInt(ZPColors.darkGray.value),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 3),
              child: pw.Text(
                'or'.tr().toUpperCase(),
                style: largePwTextStyle.copyWith(
                  color: PdfColor.fromInt(ZPColors.darkGray.value),
                ),
              ),
            ),
            pw.Container(
              width: 1,
              height: 35,
              color: PdfColor.fromInt(ZPColors.darkGray.value),
            ),
          ],
        ),
      );

  pw.Widget get _bankInNotes {
    final normalNotesStyle = mediumPwTextStyle.copyWith(
      color: PdfColor.fromInt(ZPColors.neutralsGrey1.value),
    );

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Notes'.tr(),
          style: normalNotesStyle.copyWith(fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'For OTC payments, write the 16-digit Payment Advice No. (ex. 09EP230001568101) on the bank deposit slip.'
              .tr(),
          style: normalNotesStyle,
        ),
        pw.SizedBox(height: 5),
        pw.RichText(
          text: pw.TextSpan(
            children: [
              pw.TextSpan(
                text: 'For online banking, select '.tr(),
                style: normalNotesStyle,
              ),
              pw.TextSpan(
                text: 'Bills Payment'.tr(),
                style:
                    normalNotesStyle.copyWith(fontWeight: pw.FontWeight.bold),
              ),
              pw.TextSpan(
                text:
                    ' and input the 16-digit Payment Advice No. (ex. 09EP230001568101) for your reference number.'
                        .tr(),
                style: normalNotesStyle,
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'Please DO NOT use the Funds Transfer facility.'.tr(),
          style: normalNotesStyle.copyWith(fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  pw.ThemeData _getThemeData(pw.Font font) {
    final textStyle = pw.TextStyle(font: font);

    return pw.ThemeData(
      defaultTextStyle: textStyle,
      paragraphStyle: textStyle,
      header0: textStyle,
      header1: textStyle,
      header2: textStyle,
      header3: textStyle,
      header4: textStyle,
      header5: textStyle,
      bulletStyle: textStyle,
      tableHeader: textStyle,
      tableCell: textStyle,
    );
  }

  Future<Uint8List> createInvoicePdf({
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required DateTimeStringValue createdDate,
    required AdviceExpiryValue adviceExpiry,
  }) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.notoSansThaiMedium();
    final headerInvoice = await _headerInvoice(
      headerLogoPath: paymentInvoiceInfoPdf.headerLogoPath,
      zzAdvice: paymentInvoiceInfoPdf.zzAdvice,
    );
    final description = await _description(
      pleaseNote: paymentInvoiceInfoPdf.pleaseNote,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.copyWith(height: double.infinity),
        margin: const pw.EdgeInsets.all(0),
        theme: _getThemeData(font),
        build: (context) {
          return pw.Column(
            children: [
              headerInvoice,
              _infoCustomerAndAmount(
                shipToInfo: shipToInfo,
                payer: paymentInvoiceInfoPdf.payer,
                paymentItems: paymentInvoiceInfoPdf.paymentItems,
                paymentDue: paymentInvoiceInfoPdf.paymentDue,
                customerName: paymentInvoiceInfoPdf.customerName,
              ),
              _expireInvoice(
                paymentMethod:
                    paymentInvoiceInfoPdf.paymentMethod.getOrDefaultValue(''),
                expiryDate: expiryDate(
                  valueDate: createdDate,
                  expiryDays: adviceExpiry.expiryDays,
                ),
                createdDate: createdDate,
              ),
              if (salesOrganisation.salesOrg.isSg) ...[
                _paymentSteps,
                _qrCodeAndBankInfo(
                  qrCode: paymentInvoiceInfoPdf.qrCode,
                  bankBeneficiary: paymentInvoiceInfoPdf.firstBankBeneficiary,
                ),
              ],
              if (paymentInvoiceInfoPdf.paymentMethod.isBankIn) ...[
                _bankInPaymentInfo(
                  paymentInvoiceInfoPdf: paymentInvoiceInfoPdf,
                ),
              ],
              pw.SizedBox(height: 20),
              _item(
                paymentItems: paymentInvoiceInfoPdf.paymentItems,
                salesOrganisation: salesOrganisation,
              ),
              pw.SizedBox(height: 60),
              description,
              _footerInvoice(footer: paymentInvoiceInfoPdf.footer),
            ],
          );
        },
      ),
    );

    return await pdf.save();
  }
}
