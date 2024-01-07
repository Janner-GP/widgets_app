import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screen/screens.dart';

final appRoute = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardScreen(),
    ),

     GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),

    GoRoute(
      path: '/app-tutorial',
      builder: (context, state) => const AppTutorialScreen(),
    ),

     GoRoute(
      path: '/ui-controls',
      builder: (context, state) => const UiControlScreen(),
    ),

     GoRoute(
      path: '/snackbars',
      builder: (context, state) => const SnackbarScreen(),
    ),

     GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),

     GoRoute(
      path: '/infinite-scroll',
      builder: (context, state) => const InfiniteScrollScreen(),
    )

  ]
);