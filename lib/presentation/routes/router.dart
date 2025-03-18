//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

//ignore: unused-code
@AutoRouterConfig(replaceInRouteName: 'Page,Route,Tab')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashPageRoute.page, initial: true),
        AutoRoute(path: '/login', page: LoginPageRoute.page),
        AutoRoute(path: '/forgot_password', page: ForgetPasswordPageRoute.page),
        AutoRoute(
          path: '/forgot_password_confirmation',
          page: ForgetPasswordConfirmationPageRoute.page,
        ),
        AutoRoute(
          path: '/reset_password_link_expired',
          page: ResetPasswordLinkExpiredPageRoute.page,
        ),
        AutoRoute(
          path: '/reset_password',
          page: ResetPasswordPageRoute.page,
        ),
        AutoRoute(
          path: '/reset_password_success',
          page: ResetPasswordSuccessRoute.page,
        ),
        AutoRoute(
          path: '/web_view',
          page: WebViewPageRoute.page,
        ),
        AutoRoute(
          path: '/static_html_viewer',
          page: StaticHtmlViewerRoute.page,
        ),
        AutoRoute(
          path: '/change_password',
          page: ChangePasswordPageRoute.page,
        ),
        AutoRoute(
          path: '/contact_us',
          page: ContactUsPageRoute.page,
        ),
        AutoRoute(
          path: '/notification_settings',
          page: NotificationSettingsPageRoute.page,
        ),
        AutoRoute(
          path: '/privacy_consent',
          page: PrivacyConsentPageRoute.page,
        ),
        CustomRoute(
          path: '/customer_search',
          page: CustomerSearchPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: '/terms_of_service',
          page: AupTCPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        AutoRoute(
          path: '/orders/cart',
          page: CartPageRoute.page,
        ),
        AutoRoute(
          path: '/orders/cart/checkout',
          page: CheckoutPageRoute.page,
        ),
        AutoRoute(
          path: '/orders/order_confirmation',
          page: OrderSuccessPageRoute.page,
        ),
        CustomRoute(
          path: '/product_suggestion',
          page: ProductSuggestionPageRoute.page,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
        ),
        AutoRoute(
          page: PaymentPageRoute.page,
          path: '/payments',
        ),
        AutoRoute(
          page: ProfilePageRoute.page,
          path: '/profile',
        ),
        AutoRoute(
          page: EZPointWebviewPageRoute.page,
          path: '/eZPoint',
        ),
        AutoRoute(
          path: '/payments/payment_summary',
          page: PaymentSummaryPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/invoice_credit',
          page: AccountSummaryRoute.page,
          children: [
            AutoRoute(
              path: 'all_invoices',
              page: AllInvoicesPageRoute.page,
            ),
            AutoRoute(
              path: 'all_credits',
              page: AllCreditsPageRoute.page,
            ),
            AutoRoute(
              path: 'full_summary',
              page: FullSummaryPageRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/main',
          page: HomeNavigationTabbarRoute.page,
          children: [
            AutoRoute(
              page: HomeTabRoute.page,
              path: 'home',
            ),
            AutoRoute(
              page: ProductsTabRoute.page,
              path: 'products',
            ),
            AutoRoute(
              page: OrdersTabRoute.page,
              path: 'orders_tab',
              children: [
                AutoRoute(
                  page: ViewByItemsPageRoute.page,
                  path: 'orders/view_by_items',
                ),
                AutoRoute(
                  page: ViewByOrdersPageRoute.page,
                  path: 'orders/view_by_orders',
                ),
              ],
            ),
            AutoRoute(
              page: MoreTabRoute.page,
              path: 'more',
            ),
            AutoRoute(
              page: NotificationTabRoute.page,
              path: 'notification_tab',
            ),
          ],
        ),
        AutoRoute(
          path: '/pdf_view',
          page: PdfViewPageRoute.page,
        ),
        AutoRoute(
          path: '/return_root',
          page: ReturnRootRoute.page,
          children: [
            AutoRoute(
              page: ReturnByItemPageRoute.page,
              path: 'return_by_item',
              initial: true,
            ),
            AutoRoute(
              page: ReturnByRequestPageRoute.page,
              path: 'return_by_request',
            ),
          ],
        ),
        AutoRoute(
          path: '/payments/payment_summary/payment_summary_details',
          page: PaymentSummaryDetailsPageRoute.page,
        ),
        AutoRoute(
          path: '/orders/scan_material_info',
          page: ScanMaterialInfoRoute.page,
        ),
        AutoRoute(
          path: '/announcement_info_details',
          page: AnnouncementInfoDetailsPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/invoice_details',
          page: InvoiceDetailsPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/credit_details',
          page: CreditDetailsPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/payments_webview',
          page: PaymentWebviewPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/new_payment',
          page: NewPaymentPageRoute.page,
          children: [
            AutoRoute(
              page: OutstandingInvoicesTabRoute.page,
              path: 'payments/new_payment/outstanding_invoices',
            ),
            AutoRoute(
              page: AvailableCreditsTabRoute.page,
              path: 'payments/new_payment/available_credits',
            ),
            AutoRoute(
              page: PaymentMethodTabRoute.page,
              path: 'payments/new_payment/payment_method',
            ),
          ],
        ),
        AutoRoute(
          path: '/payments/statement_accounts',
          page: StatementAccountsPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/payment_advice_created',
          page: PaymentAdviceCreatedPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/payment_completed',
          page: PaymentCompletedPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/payment_failed',
          page: PaymentFailedPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/claim_management',
          page: ClaimManagementPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/new_claim_submission',
          page: NewClaimSubmissionPageRoute.page,
        ),
        AutoRoute(
          path: '/payments/claim_submitted',
          page: ClaimSubmittedPageRoute.page,
        ),
        CustomRoute(
          path: '/intro',
          page: IntroPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        AutoRoute(
          page: ViewByItemDetailsPageRoute.page,
          path: '/orders/view_by_item_details',
        ),
        AutoRoute(
          page: ViewByOrderDetailsPageRoute.page,
          path: '/orders/view_by_order_details',
        ),
        AutoRoute(
          page: BundleDetailPageRoute.page,
          path: '/orders/bundle_detail',
        ),
        AutoRoute(
          path: '/orders/material_details',
          page: ProductDetailsPageRoute.page,
        ),
        AutoRoute(
          path: '/returns/return_summary_details_v3',
          page: ReturnRequestSummaryByItemDetailsRoute.page,
        ),
        AutoRoute(
          path: '/announcements',
          page: AnnouncementsPageRoute.page,
          children: [
            AutoRoute(
              page: ArticlesTabRoute.page,
              path: 'articles_tab',
            ),
            AutoRoute(
              page: AnnouncementsTabRoute.page,
              path: 'announcements_tab',
            ),
          ],
        ),
        AutoRoute(
          path: '/article_details',
          page: ArticleDetailsRoute.page,
        ),
        AutoRoute(
          page: ReturnRequestDetailsRoute.page,
          path: '/returns/return_summary_details_by_request',
        ),
        AutoRoute(
          page: SalesOrgSearchRoute.page,
          path: '/salesOrg_search',
        ),
        AutoRoute(
          page: FAQPageRoute.page,
          path: '/faq',
        ),
        AutoRoute(
          page: NewRequestPageRoute.page,
          path: '/returns/new_request',
          children: [
            AutoRoute(
              page: ReturnItemsTabRoute.page,
              path: 'returns/new_request/return_items',
            ),
            AutoRoute(
              page: ReturnDetailsTabRoute.page,
              path: 'returns/new_request/return_details',
            ),
            AutoRoute(
              page: ReturnReviewTabRoute.page,
              path: 'returns/new_request/return_review',
            ),
          ],
        ),
        AutoRoute(
          page: NewRequestSuccessfulPageRoute.page,
          path: '/returns/new_request_successful',
        ),
        AutoRoute(
          page: AboutUsPageRoute.page,
          path: '/about_us',
        ),
        AutoRoute(
          page: ComboDetailPageRoute.page,
          path: '/combo_detail',
        ),
        CustomRoute(
          path: '/small_order_fee',
          page: SmallOrderFeePageRoute.page,
          customRouteBuilder: modalSheetBuilder,
          barrierDismissible: false,
        ),
        CustomRoute(
          path: '/select_order_type',
          page: SelectOrderTypeBottomSheetRoute.page,
          customRouteBuilder: modalSheetBuilder,
          barrierDismissible: false,
        ),
        CustomRoute(
          path: '/national_privacy_commission',
          page: NationalPrivacyCommissionPageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        AutoRoute(
          page: SubmitTicketPageRoute.page,
          path: '/submit_ticket',
        ),
      ];
}

Route<T> modalSheetBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return ModalBottomSheetRoute(
    settings: page,
    builder: (context) => child,
    isScrollControlled: true,
    isDismissible: false,
  );
}

// const authRouter = AutoRoute(
//   name: 'AuthRouter',
//   page: AuthWrapperPage,
//   path: 'auth',
//   children: [
//     AutoRoute(path: 'login', page: LoginPage, initial: true),
//     RedirectRoute(path: '*', redirectTo: ''),
//   ],
// );

// const mainRouter = AutoRoute(
//   initial: true,
//   name: 'MainRouter',
//   page: MainWrapperPage,
//   path: 'main',
//   children: [
//     AutoRoute(
//       path: 'main_tabbar',
//       page: HomeNavigationTabbar,
//       children: [
//         AutoRoute(page: HomeTab),
//         AutoRoute(page: OrderTab),
//         AutoRoute(page: HistoryTab),
//         AutoRoute(page: FavoriteTab),
//       ],
//     ),
//     RedirectRoute(path: '*', redirectTo: ''),
//   ],
// );

// class AuthGuard extends AutoRouteGuard {
//   final AuthBloc authBloc;

//   AuthGuard(this.authBloc);

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     authBloc.state.map(
//       initial: (_) => null,
//       loading: (_) => null,
//       failure: (_) => null,
//       unauthenticated: (_) => router.push(const LoginPageRoute()),
//       authenticated: (_) => resolver.next(),
//     );
//   }
// }
