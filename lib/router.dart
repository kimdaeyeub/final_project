import 'package:final_project/features/auth/repo/auth_repository.dart';
import 'package:final_project/features/auth/views/login_screen.dart';
import 'package:final_project/features/auth/views/sign_up_screen.dart';
import 'package:final_project/features/common/main_navigation_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return LoginScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: LoginScreen.routeURL,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeURL,
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: "/:tab(home|write)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.pathParameters["tab"];
          int selectedIndex = 0;
          if (tab == "home") {
            selectedIndex = 0;
          } else {
            selectedIndex = 1;
          }

          return MainNavigationScreen(
            tab: tab!,
            selectedIndex: selectedIndex,
          );
        },
      ),
    ],
  );
});
