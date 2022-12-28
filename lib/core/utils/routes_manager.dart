import '../../presentations/04_forgot_password/view/forgot_pasword.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app/di.dart';
import '../../presentations/00_splash/splash_view.dart';
import '../../presentations/01_onboarding/view/onboarding_view.dart';
import '../../presentations/02_login/view/login_view.dart';
import '../../presentations/03_register/view/register_view.dart';
import '../../presentations/05_main/main_view.dart';
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
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
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
          title: Text(
            AppStrings.noRouteFound.tr(),
          ),
        ),
        body: Center(
          child: Text(
            AppStrings.noRouteFound.tr(),
          ),
        ),
      ),
    );
  }
}
