import 'package:get/get.dart';

import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/myTicket/bindings/my_ticket_binding.dart';
import '../modules/myTicket/views/my_ticket_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/orderTicket/bindings/order_ticket_binding.dart';
import '../modules/orderTicket/views/order_ticket_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/ticketSearchResults/bindings/ticket_search_results_binding.dart';
import '../modules/ticketSearchResults/views/ticket_search_results_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
  ];
}
