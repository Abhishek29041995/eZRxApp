import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late CartBloc cartBloc;

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      cartBloc = CartBlocMock();
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          isFetching: false,
        ),
      );
    },
  );
  // group('Remarks Form Test', () {
  //   Widget getWidget() {
  //     return MultiBlocProviderFrameWrapper(
  //       providers: [
  //         BlocProvider<CartBloc>(create: (context) => cartBloc),
  //       ],
  //       child: const RemarksForm(),
  //     );
  //   }

  //   testWidgets(
  //     'Remarks Form Empty Validation check',
  //     (tester) async {
  //       final expectedStates = [
  //         CartState.initial().copyWith(
  //           isFetching: false,
  //           showErrorMessages: true,
  //           remarks: Remarks('test'),
  //         ),
  //         CartState.initial().copyWith(
  //           isFetching: false,
  //           showErrorMessages: true,
  //           remarks: Remarks(''),
  //         ),
  //       ];
  //       whenListen(cartBloc, Stream.fromIterable(expectedStates));

  //       await tester.pumpWidget(getWidget());
  //       await tester.pump();
  //       final quantityInput = find.byKey(const ValueKey('remarkTextField'));
  //       expect(quantityInput, findsOneWidget);
  //       final errorText = find.textContaining('Remarks cannot be empty.'.tr());
  //       expect(errorText, findsOneWidget);
  //     },
  //   );

  //   testWidgets(
  //     'Remarks Form Validation check',
  //     (tester) async {
  //       final expectedStates = [
  //         CartState.initial().copyWith(
  //           isFetching: false,
  //           showErrorMessages: false,
  //           remarks: Remarks('test'),
  //         ),
  //         CartState.initial().copyWith(
  //           isFetching: false,
  //           showErrorMessages: true,
  //           remarks: Remarks('test'),
  //         ),
  //       ];
  //       whenListen(cartBloc, Stream.fromIterable(expectedStates));
  //       when(() => cartBloc.state).thenReturn(
  //         CartState.initial().copyWith(
  //           isFetching: false,
  //           showErrorMessages: true,
  //           remarks: Remarks('test'),
  //         ),
  //       );

  //       await tester.pumpWidget(getWidget());
  //       await tester.pump();
  //       final quantityInput = find.byKey(const ValueKey('remarkTextField'));
  //       expect(quantityInput, findsOneWidget);
  //       final errorText = find.textContaining('Remarks cannot be empty.'.tr());
  //       expect(errorText, findsNothing);
  //     },
  //   );
  // });
}
