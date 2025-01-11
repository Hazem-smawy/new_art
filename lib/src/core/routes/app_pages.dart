import 'package:get/get.dart';
import 'package:new_art/src/features/artist/presentation/pages/all_artist_page.dart';
import 'package:new_art/src/features/auth/presentation/pages/auth_page.dart';
import 'package:new_art/src/features/bunch/presentation/pages/pages.dart';
import 'package:new_art/src/features/chat/presentation/pages/chat_page.dart';
import 'package:new_art/src/features/home/presentation/pages/main_page.dart';
import 'package:new_art/src/features/new_work/presentation/pages/all_work_page.dart';
import 'package:new_art/src/features/order/presentation/pages/add_order_page.dart';
import 'package:new_art/src/features/order/presentation/pages/all_orders_page.dart';
import 'package:new_art/src/features/order/presentation/pages/chopping_cart_page.dart';
import 'package:new_art/src/features/order/presentation/pages/track_order_page.dart';
import 'package:new_art/src/features/points/presentation/pages/points_page.dart';
import 'package:new_art/src/features/points/presentation/pages/points_statics_page.dart';
import 'package:new_art/src/features/user/presentation/pages/user_page.dart';
import 'package:new_art/src/features/wallet/presentation/pages/wallet_page.dart';

import '../../features/banks/presentation/pages/our_bank_accounts_page.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.MAIN;
  static final routesPage = [
    GetPage(
      name: Routes.AUTH,
      page: () => AuthPage(),
      // bindings: [
      //   AuthBinding(),
      // ],
      // middlewares: [
      //   AuthMiddleware(),
      // ],
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
    ),
    GetPage(
      name: Routes.ADD_ORDER,
      page: () => const AddOrderPage(),
    ),
    GetPage(
      name: Routes.BANK_ACCOUNTS,
      page: () => const OutBankAccountsPage(),
    ),
    GetPage(
      name: Routes.NEW_WORK_PAGE,
      page: () => const AllWorkPage(),
    ),
    GetPage(
      name: Routes.ALL_ORDER,
      page: () => const AllOrdersPage(),
    ),
    GetPage(
      name: Routes.SHOPPING_CART,
      page: () => const ShoppingCartPage(),
    ),
    GetPage(
      name: Routes.ALL_ARTISTS,
      page: () => const AllArtistPage(),
    ),
    GetPage(
      name: Routes.USER,
      page: () => const UserPage(),
    ),
    GetPage(
      name: Routes.USER,
      page: () => const PointsPage(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
    ),
    GetPage(
      name: Routes.POINTS,
      page: () => PointsPage(),
    ),
    GetPage(
      name: Routes.WALLET,
      page: () => WalletPage(),
    ),
    GetPage(
      name: Routes.TRACK_ORDER,
      page: () => TrackOrderPage(),
    ),
    GetPage(
      name: Routes.POINTS_STATICS,
      page: () => PointsStaticsPage(),
    ),
    GetPage(
      name: Routes.BUNCH,
      page: () => BunchPage(),
    ),
  ];
}
