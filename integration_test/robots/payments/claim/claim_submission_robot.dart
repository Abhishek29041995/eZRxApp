import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';

class ClaimSubmissionRobot extends CommonRobot {
  final _claimSubmissionPage = find.byKey(WidgetKeys.newClaimSubmissionPage);
  final _closeButton = find.byKey(WidgetKeys.closeButton);
  final _submitClaimButton =
      find.byKey(WidgetKeys.claimSubmittedCreateNewClaimButton);
  final _claimDetailField =
      find.byKey(WidgetKeys.newClaimClaimDetailsTextField);
  final _claimTypeField = find.byKey(WidgetKeys.newClaimClaimTypeDropdown);
  final _amountField = find.byKey(WidgetKeys.newClaimClaimAmountTextField);
  final _principalField = find.byKey(WidgetKeys.newClaimPrincipalCodeTextField);
  final _principalFieldItem =
      find.byKey(WidgetKeys.newClaimPrincipalCodeTextFieldItem);
  final _documentUploadButton = find.byKey(WidgetKeys.newClaimDocumentUpload);
  final _uploadDocumentItem = find.byKey(WidgetKeys.uploadDocumentItem);
  final _poAttachmentUploadBottomsheet =
      find.byKey(WidgetKeys.poAttachmentUploadBottomsheet);
  final _uploadDocumentDeleteButton =
      find.byKey(WidgetKeys.uploadDocumentDeleteButton);

  ClaimSubmissionRobot(super.tester);

  void verifyPage() {
    expect(_claimSubmissionPage, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(_closeButton);
    await tester.pumpAndSettle();
  }

  Future<void> enterAmountField(String input) async {
    await tester.enterText(_amountField, input);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterDetailField(String input) async {
    await tester.enterText(_claimDetailField, input);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> enterClaimType(String text) async {
    await tester.tap(_claimTypeField);
    await tester.pumpAndSettle();
    await tester.tap(
      find.text(text),
    );
    await tester.pumpAndSettle();
  }

  Future<void> enterFirstPrincipal() async {
    await tester.tap(_principalField);
    await tester.pumpAndSettle();
    await tester.tap(_principalFieldItem.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapSubmitClaimButton() async {
    await tester.tap(_submitClaimButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapUploadButton() async {
    await tester.tap(_documentUploadButton);
    await tester.pumpAndSettle();
  }

  Future<void> _verifyComponent(
    Finder finder,
    bool isVisible,
  ) async {
    if (isVisible) {
      await scrollEnsureFinderVisible(finder);
    } else {
      expect(finder, findsNothing);
    }
  }

  Future<void> verifyPrincipalField({bool isVisible = true}) =>
      _verifyComponent(
        _principalField,
        isVisible,
      );

  Future<void> verifyClaimTypeField({bool isVisible = true}) =>
      _verifyComponent(
        _claimTypeField,
        isVisible,
      );

  Future<void> verifyAmountField({bool isVisible = true}) => _verifyComponent(
        _amountField,
        isVisible,
      );

  Future<void> verifyDetailField({bool isVisible = true}) => _verifyComponent(
        _claimDetailField,
        isVisible,
      );

  Future<void> verifyUploadButton({bool isVisible = true}) => _verifyComponent(
        _documentUploadButton,
        isVisible,
      );

  void verifyUploadBottomSheet({bool isVisible = true}) => expect(
        _poAttachmentUploadBottomsheet,
        isVisible ? findsOneWidget : findsNothing,
      );

  void verifyUploadExceedMaximumSizeMessage({bool isVisible = true}) => expect(
        find.text(
          'Exceed maximum file size of {maximumUploadSize}MB'.tr(
            namedArgs: {
              'maximumUploadSize': '20',
            },
          ),
        ),
        isVisible ? findsOneWidget : findsNothing,
      );

  Future<void> tapOpenGallery() async {
    await tester.tap(
      find.byKey(WidgetKeys.poAttachmentOption(UploadOptionType.gallery.name)),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapDocumentDeleteButton(int index) async {
    await tester.tap(
      _uploadDocumentDeleteButton.at(index),
    );
    await tester.pumpAndSettle();
  }

  void verifySubmitButton() => expect(_submitClaimButton, findsOneWidget);

  Future<void> verifyUploadItems({required int numberOfFile}) async {
    if (numberOfFile == 0) {
      expect(_uploadDocumentItem, findsNothing);
      return;
    }
    await _verifyComponent(find.byKey(WidgetKeys.attachmentsTileKey), true);
    expect(_uploadDocumentItem, findsNWidgets(numberOfFile));
  }
}
