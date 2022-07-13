import 'package:flutter/material.dart';
import 'package:future_bride/Presention/Splash/splash_veiw.dart';

import '../Main_veiw/main_veiw.dart';
import '../OnBoarding/OnBoarding_veiw.dart';
import '../REGISTER/register_veiw.dart';
import '../forget_pass/forget_pass_veiw.dart';
import '../login/login_veiw.dart';
import 'String.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
}

class RouteGeneratour {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
