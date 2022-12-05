import '../../app/di.dart';
import '../../presentations/00_splash/splash_view.dart';
import '../../presentations/01_onboarding/view/onboarding_view.dart';
import '../../presentations/02_login/view/login_view.dart';
import '../../presentations/03_register/view/register_view.dart';
import '../../presentations/05_main/view/main_view.dart';
import '../../presentations/06_store_details/view/store_details_view.dart';
import 'package:flutter/material.dart';

import 'strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const StoreDetailsView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.onRouteFound),
        ),
        body: const Center(child: Text(AppStrings.onRouteFound)),
      ),
    );
  }
}
