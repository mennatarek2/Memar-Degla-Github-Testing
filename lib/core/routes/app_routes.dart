import 'package:go_router/go_router.dart';
import 'package:memar_degla/features/authentication/presentation/views/login_screen.dart';
import 'package:memar_degla/features/contrcats/data/models/contracts_models.dart';
import 'package:memar_degla/features/contrcats/presentation/views/document_screen.dart';
import 'package:memar_degla/features/contrcats/presentation/views/my_contracts_details_screen.dart';
import 'package:memar_degla/features/contrcats/presentation/views/my_contracts_screen.dart';
import 'package:memar_degla/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:memar_degla/features/authentication/presentation/views/profile_screen.dart';
import 'package:memar_degla/features/home/presentation/views/home_screen.dart';
import 'package:memar_degla/features/points/presentation/views/redeem_points_screen.dart';
import 'package:memar_degla/features/splash/presentation/views/splash_screen.dart';
import 'package:memar_degla/features/support/presentation/views/support_screen.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/presentation/views/unit_details_screen.dart';
import 'package:memar_degla/features/units/presentation/views/units_screen.dart';

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

  static final GoRouter router = GoRouter(
    initialLocation: units,
    routes: [
      GoRoute(
        path: units,
        name: 'units',
        builder: (context, state) {
          return const UnitsScreen();
        },
      ),
      GoRoute(
        path: unitDetails,
        name: 'unitDetails',
        builder: (context, state) {
          final unitDetails = state.extra as UnitDetailsModel;

          return UnitDetailsScreen(unitDetailsModel: unitDetails);
        },
      ),
    ],
  );
}
