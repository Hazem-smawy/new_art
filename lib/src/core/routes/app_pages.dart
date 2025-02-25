import 'package:get/get.dart';
import 'package:newart/src/core/middleware/auth_middleware.dart';
import 'package:newart/src/features/artist/presentation/pages/all_artist_page.dart';
import 'package:newart/src/features/auth/presentation/pages/auth_page.dart';
import 'package:newart/src/features/banks/presentation/getX/banks_binding.dart';
import 'package:newart/src/features/banks/presentation/pages/our_bank_accounts_page.dart';
import 'package:newart/src/features/bunch/presentation/getX/bunch_binding.dart';
import 'package:newart/src/features/bunch/presentation/pages/bunch_page.dart';
import 'package:newart/src/features/chat/presentation/pages/chat_page.dart';
import 'package:newart/src/features/home/presentation/pages/main_page.dart';
import 'package:newart/src/features/order/presentation/getX/order_binding.dart';
import 'package:newart/src/features/order/presentation/pages/add_mod_order_page.dart';
import 'package:newart/src/features/order/presentation/pages/add_order_page.dart';
import 'package:newart/src/features/order/presentation/pages/track_order_page.dart';
import 'package:newart/src/features/points/presentation/pages/points_page.dart';
import 'package:newart/src/features/points/presentation/pages/points_statics_page.dart';
import 'package:newart/src/features/user/presentation/pages/user_page.dart';
import 'package:newart/src/features/wallet/presentation/getX/wallet_binding.dart';
import 'package:newart/src/features/wallet/presentation/pages/all_payment_page.dart';
import 'package:newart/src/features/wallet/presentation/pages/wallet_page.dart';

import '../../features/exclusive/presentation/getX/exclusive_binding.dart';
import '../../features/exclusive/presentation/pages/exclusive_page.dart';
import '../../features/product/presentation/getX/product_binding.dart';
import '../../features/product/presentation/pages/all_product_page.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.MAIN;
  static final routesPage = [
    GetPage(name: Routes.AUTH, page: () => AuthMainPage(), middlewares: []),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
    ),
    GetPage(
      name: Routes.ADD_ORDER,
      page: () => AddOrderPage(),
      binding: OrderBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.EXCLUSIVE,
      page: () => AllExclusivePage(),
      binding: ExclusiveBinding(),
    ),
    GetPage(
      name: Routes.ALL_PAYMENTS,
      page: () => AllPaymentPage(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTS,
      page: () => AllProductPage(),
      binding: ProductBinding(),
    ),

    GetPage(
      name: Routes.ADD_MOD_ORDER,
      page: () => const AddModOrderPage(),
    ),
    GetPage(
      name: Routes.ALL_ARTISTS,
      page: () => const AllArtistPage(),
    ),
    GetPage(
      name: Routes.USER,
      page: () => UserPage(),
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
        binding: OrderBinding()),
    GetPage(
      name: Routes.POINTS_STATICS,
      page: () => PointsStaticsPage(),
    ),
    // GetPage(
    //   name: Routes.TRANSFER,
    //   page: () => OrderPaymentPage(),
    // ),
    GetPage(
      name: Routes.BUNCH,
      page: () => BunchPage(),
      binding: BunchBinding(),
    ),
    GetPage(
      name: Routes.OURBANKS,
      page: () => OurBankAccountsPage(),
      binding: BanksBinding(),
    ),
  ];
}
