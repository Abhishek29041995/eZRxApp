import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/camera_files_permission_bottomsheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ViewByOrderDetailsBlocMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ViewByItemDetailsBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

void main() {
  late AppRouter autoRouterMock;
  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerFactory(() => AppRouter());
      registerFallbackValue(const PageRouteInfo('HomeTabRoute'));

      autoRouterMock = locator<AppRouter>();
    },
  );

  Widget getWidget({required PermissionType type}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: CameraFilesPermission(
        type: type,
      ),
    );
  }

  group('Test Camera Files Permission Page', () {
    testWidgets(
      'When type is camera',
      (tester) async {
        await tester.pumpWidget(getWidget(type: PermissionType.camera));
        await tester.pumpAndSettle();
        final titleText = find.text('eZRx+ is unable to turn on camera');
        expect(titleText, findsOneWidget);
        final subTitleText = find.text(
          'Camera access was denied. Grant camera access permission in Settings to capture photos on eZRx+.',
        );
        expect(subTitleText, findsOneWidget);
        final cancelButton = find.byKey(
          WidgetKeys.cancelButton,
        );
        expect(cancelButton, findsOneWidget);
        final confirmButton = find.byKey(
          WidgetKeys.confirmButton,
        );
        expect(confirmButton, findsOneWidget);
      },
    );
    testWidgets(
      'When type is files',
      (tester) async {
        await tester.pumpWidget(getWidget(type: PermissionType.files));
        await tester.pumpAndSettle();
        final titleText = find.text('eZRx+ is unable to access your files');
        expect(titleText, findsOneWidget);
        final subTitleText = find.text(
          'Photos and files access was denied. Grant photos and files access permission in Settings to upload photos and documents on eZRx+.',
        );
        expect(subTitleText, findsOneWidget);
        final cancelButton = find.byKey(
          WidgetKeys.cancelButton,
        );
        expect(cancelButton, findsOneWidget);
        final confirmButton = find.byKey(
          WidgetKeys.confirmButton,
        );
        expect(confirmButton, findsOneWidget);
      },
    );
    testWidgets(
      'When type is files cancel button tap',
      (tester) async {
        await tester.pumpWidget(getWidget(type: PermissionType.files));
        await tester.pumpAndSettle();
        final cancelButton = find.byKey(
          WidgetKeys.cancelButton,
        );
        expect(cancelButton, findsOneWidget);
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.current.name,
          'Root',
        );
      },
    );

    testWidgets(
      'When type is files confirm button tap',
      (tester) async {
        const channel =
            MethodChannel('flutter.baseflow.com/permissions/methods');
        // Mock the method call for openAppSettings
        tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            return false;
          },
        );
        await tester.pumpWidget(getWidget(type: PermissionType.files));
        await tester.pumpAndSettle();
        final cancelButton = find.byKey(
          WidgetKeys.confirmButton,
        );
        expect(cancelButton, findsOneWidget);
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.pageCount,
          0,
        );
      },
    );

    testWidgets(
      'When type is camera cancel button tap',
      (tester) async {
        await tester.pumpWidget(getWidget(type: PermissionType.camera));
        await tester.pumpAndSettle();
        final cancelButton = find.byKey(
          WidgetKeys.cancelButton,
        );
        expect(cancelButton, findsOneWidget);
        await tester.tap(cancelButton);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.pageCount,
          0,
        );
      },
    );
    testWidgets(
      'When type is camera confirm Button tap',
      (tester) async {
        const channel =
            MethodChannel('flutter.baseflow.com/permissions/methods');
        // Mock the method call for openAppSettings
        tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            return false;
          },
        );
        await tester.pumpWidget(getWidget(type: PermissionType.camera));
        await tester.pumpAndSettle();
        final confirmButton = find.byKey(
          WidgetKeys.confirmButton,
        );
        expect(confirmButton, findsOneWidget);
        await tester.tap(confirmButton);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.pageCount,
          0,
        );
      },
    );
  });
}
