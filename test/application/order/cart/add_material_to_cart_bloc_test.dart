///Todo: Write again
library;
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final mockCartBloc = MockCartBloc();

  group('Testing addMaterialToCart', () {
    setUp(() {
      when(() => mockCartBloc.state).thenReturn(CartState.initial());
    });
  });
}
