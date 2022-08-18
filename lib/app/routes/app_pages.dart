import 'package:get/get.dart';

import 'package:rental_cars/app/modules/bookings/bindings/bookings_binding.dart';
import 'package:rental_cars/app/modules/bookings/views/bookings_view.dart';
import 'package:rental_cars/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:rental_cars/app/modules/checkout/views/checkout_view.dart';
import 'package:rental_cars/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:rental_cars/app/modules/dashboard/views/dashboard_view.dart';
import 'package:rental_cars/app/modules/help_us/bindings/help_us_binding.dart';
import 'package:rental_cars/app/modules/help_us/views/help_us_view.dart';
import 'package:rental_cars/app/modules/home/bindings/home_binding.dart';
import 'package:rental_cars/app/modules/home/views/home_view.dart';
import 'package:rental_cars/app/modules/login_screen/bindings/login_screen_binding.dart';
import 'package:rental_cars/app/modules/login_screen/views/login_screen_view.dart';
import 'package:rental_cars/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:rental_cars/app/modules/sign_up/views/sign_up_view.dart';
import 'package:rental_cars/app/modules/view_cars/bindings/view_cars_binding.dart';
import 'package:rental_cars/app/modules/view_cars/views/view_cars_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_CARS,
      page: () => ViewCarsView(),
      binding: ViewCarsBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.HELP_US,
      page: () => HelpUsView(),
      binding: HelpUsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => BookingsView(),
      binding: BookingsBinding(),
    ),
  ];
}
