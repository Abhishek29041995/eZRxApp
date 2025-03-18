import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/login_on_behalf_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class ProxyLoginFormBlocMock
    extends MockBloc<ProxyLoginFormEvent, ProxyLoginFormState>
    implements ProxyLoginFormBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialListBlockMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

final locator = GetIt.instance;

void main() {
  late UserBloc userBlocMock;
  late ProxyLoginFormBloc proxyLoginFormBlocMock;
  late SalesOrgBlocMock salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialListBloc materialListBlocMock;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    userBlocMock = UserBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    proxyLoginFormBlocMock = ProxyLoginFormBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    materialListBlocMock = MaterialListBlockMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => proxyLoginFormBlocMock.state)
        .thenReturn(ProxyLoginFormState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<ProxyLoginFormBloc>(
          create: (context) => proxyLoginFormBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => materialListBlocMock,
        ),
      ],
      child: const Material(child: LoginOnBehalfSheet()),
    );
  }

  group('Test "Log in on Behalf Sheet"', () {
    testWidgets('On Press Log in on behalf and show bottomsheet',
        (tester) async {
      when(() => proxyLoginFormBlocMock.state).thenReturn(
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(Right(Login.empty())),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(LoginOnBehalfSheet), findsOneWidget);
      expect(find.byKey(WidgetKeys.proxyLoginUserNameField), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.loginOnBehalfCancelButtonKey),
        findsOneWidget,
      );
    });
    testWidgets('Proxy Login User Name Field test', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(LoginOnBehalfSheet), findsOneWidget);
      final proxyLoginUserNameField =
          find.byKey(WidgetKeys.proxyLoginUserNameField);
      expect(find.byKey(WidgetKeys.proxyLoginUserNameField), findsOneWidget);
      await tester.enterText(proxyLoginUserNameField, 'fake_name');
      await tester.pump();
      verify(
        () => proxyLoginFormBlocMock.add(
          const ProxyLoginFormEvent.usernameChanged('fake_name'),
        ),
      ).called(1);
    });
    testWidgets('success section', (tester) async {
      final expectedState = [
        ProxyLoginFormState.initial(),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(Right(Login.empty())),
        ),
      ];
      whenListen(proxyLoginFormBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verify(
        () => salesOrgBlocMock.add(const SalesOrgEvent.initialized()),
      ).called(1);
      verify(
        () => eligibilityBlocMock.add(const EligibilityEvent.initialized()),
      ).called(1);
    });
    testWidgets('Failure section', (tester) async {
      final expectedState = [
        ProxyLoginFormState.initial(),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake_error'))),
        ),
      ];
      whenListen(proxyLoginFormBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      verifyNever(
        () => salesOrgBlocMock.add(const SalesOrgEvent.initialized()),
      );
      verifyNever(
        () => eligibilityBlocMock.add(const EligibilityEvent.initialized()),
      );
    });
  });
}
