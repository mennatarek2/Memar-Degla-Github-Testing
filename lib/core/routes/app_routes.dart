import 'package:go_router/go_router.dart';

import 'package:memar_degla/features/installments/presentation/views/installments_screen.dart';

class AppRoutes {
  static const String installments = '/profile/installments';
  static const String installmentsDetails = 'profile/instalmmentsDetails';

  static final GoRouter router = GoRouter(
    initialLocation: installments,
    routes: [
      GoRoute(
        path: installments,
        name: 'installments',
        builder: (context, state) => const InstallmentsScreen(),
      ),

      GoRoute(
        path: installmentsDetails,
        name: 'installmentsDetails',
        builder: (context, state) => const InstallmentsScreen(),
      ),
    ],
  );
}
