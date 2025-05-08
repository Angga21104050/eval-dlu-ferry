import 'package:get/get.dart';

import '../modules/change-password/bindings/change_password_binding.dart';
import '../modules/change-password/views/change_password_view.dart';
import '../modules/edit-profile/bindings/edit_profile_binding.dart';
import '../modules/edit-profile/views/edit_profile_view.dart';
import '../modules/forgot-password/bindings/forgot_password_binding.dart';
import '../modules/forgot-password/views/forgot_password_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/myTicket/bindings/my_ticket_binding.dart';
import '../modules/myTicket/views/my_ticket_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/orderTicket/bindings/order_ticket_binding.dart';
import '../modules/orderTicket/views/order_ticket_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/ticketSearchResults/bindings/ticket_search_results_binding.dart';
import '../modules/ticketSearchResults/views/ticket_search_results_view.dart';
import '../modules/transaction-succ/bindings/transaction_succ_binding.dart';
import '../modules/transaction-succ/views/transaction_succ_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.MY_TICKET,
      page: () => const MyTicketView(),
      binding: MyTicketBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_SEARCH_RESULTS,
      page: () => const TicketSearchResultsView(),
      binding: TicketSearchResultsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_TICKET,
      page: () => const OrderTicketView(),
      binding: OrderTicketBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => const InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_SUCC,
      page: () => const TransactionSuccView(),
      binding: TransactionSuccBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
  ];
}
