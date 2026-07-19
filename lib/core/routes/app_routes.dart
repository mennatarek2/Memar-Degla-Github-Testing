import 'package:go_router/go_router.dart';
import 'package:memar_degla/features/points/presentation/views/offers_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String main = '/main';
  static const String storeDetails = '/storeDetails';
  static const String home = '/home';
  static const String offers = '/offers';
  static const String wallet = '/wallet';
  static const String units = '/units';
  static const String settings = '/profile/settings';
  static const String installments = '/profile/installments';
  static const String contracts = '/profile/contracts';
  static const String referrals = '/profile/referrals';
  static const String documents = '/profile/documents';
  static const String profile = '/profile';
  static const String myCoontractsDetails = '/profile/contract/contractDetails';
  static const String support = '/profile/support';
  static const String redeem = '/redeem';
  static const String unitDetails = '/unitDetails';
  static const String offersAndPoints = '/offersAndPoints';

  static final GoRouter router = GoRouter(
    initialLocation: offersAndPoints,
    routes: [
      GoRoute(
        path: offersAndPoints,
        name: "offersAndPoints",
        builder: (context, state) => const OffersScreen(),
      ),
    ],
  );
}
