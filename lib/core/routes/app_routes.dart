import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/features/authentication/presentation/views/login_screen.dart';
import 'package:memar_degla/features/contrcats/data/models/contracts_models.dart';
import 'package:memar_degla/features/contrcats/presentation/views/document_screen.dart';
import 'package:memar_degla/features/contrcats/presentation/views/my_contracts_details_screen.dart';
import 'package:memar_degla/features/contrcats/presentation/views/my_contracts_screen.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/unit_details.dart';
import 'package:memar_degla/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:memar_degla/features/authentication/presentation/views/profile_screen.dart';
import 'package:memar_degla/features/home/presentation/views/home_screen.dart';
import 'package:memar_degla/features/points/presentation/views/redeem_points_screen.dart';
import 'package:memar_degla/features/splash/presentation/views/splash_screen.dart';
import 'package:memar_degla/features/support/presentation/views/support_screen.dart';
import 'package:memar_degla/features/units/data/models/unit_details_model.dart';
import 'package:memar_degla/features/units/presentation/views/unit_details_screen.dart';
import 'package:memar_degla/features/units/presentation/views/units_screen.dart';
import 'package:memar_degla/features/installments/presentation/views/installments_screen.dart';

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

  static CustomTransitionPage<void> _fadeSlidePage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 320),
      reverseTransitionDuration: const Duration(milliseconds: 260),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fade = CurvedAnimation(parent: animation, curve: Curves.easeOut);

        final slide =
            Tween<Offset>(
              begin: const Offset(0.04, 0), // subtle push from the right
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        return FadeTransition(
          opacity: fade,
          child: SlideTransition(position: slide, child: child),
        );
      },
    );
  }

  static CustomTransitionPage<void> _fadeOnlyPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 220),
      reverseTransitionDuration: const Duration(milliseconds: 180),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInCubic,
          ),
          child: child,
        );
      },
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        pageBuilder: (context, state) =>
            _fadeOnlyPage(state: state, child: const SplashScreen()),
      ),
      GoRoute(
        path: onBoarding,
        name: 'onBoarding',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const OnboardingScreen()),
      ),
      GoRoute(
        path: login,
        name: 'login',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const LoginScreen()),
      ),
      GoRoute(
        path: home,
        name: 'home',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const HomeScreen()),
      ),
      GoRoute(
        path: profile,
        name: 'profile',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const ProfileScreen()),
      ),
      GoRoute(
        path: units,
        name: 'units',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const UnitsScreen()),
      ),
      GoRoute(
        path: installments,
        name: 'installments',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const InstallmentsScreen()),
      ),
      GoRoute(
        path: contracts,
        name: 'myContracts',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const MyContractsScreen()),
      ),
      GoRoute(
        path: myCoontractsDetails,
        name: 'myContractDetails',
        pageBuilder: (context, state) {
          final contractModel = state.extra as ContractsModels;

          return _fadeSlidePage(
            state: state,
            child: MyContractsDetailsScreen(contractsModels: contractModel),
          );
        },
      ),
      GoRoute(
        path: support,
        name: 'support',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const SupportScreen()),
      ),
      GoRoute(
        path: redeem,
        name: 'redeemPoints',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const RedeemPointsScreen()),
      ),
      GoRoute(
        path: documents,
        name: 'documents',
        pageBuilder: (context, state) =>
            _fadeSlidePage(state: state, child: const DocumentScreen()),
      ),
      GoRoute(
        path: unitDetails,
        name: 'unitDetails',
        pageBuilder: (context, state) {
          final unitDetails = state.extra as UnitDetailsModel;

          return _fadeSlidePage(
            state: state,
            child: UnitDetailsScreen(unitDetailsModel: unitDetails),
          );
        },
      ),
    ],
  );
}
