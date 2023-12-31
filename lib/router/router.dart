import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../view/page/SC002_01_otp_page.dart';
import '../view/page/SC005_kitchen_map_page.dart';
import '../view/page/SC006_search_page.dart';
import '../view/page/SC008_meal_detail_page.dart';
import '../view/page/SC009_order_page.dart';
import '../view/page/SC010_payment_page.dart';
import '../view/page/SC013_order_detail_page.dart';
import '../view/page/SC015_notification_page.dart';
import '../view/page/SC017_kitchen_home_page.dart';
import '../view/page/SC018_01_meal_page_add.dart';
import '../view/page/SC018_02_tray_page_add.dart';
import '../view/page/SC018_03_dish_page_add.dart';
import '../view/page/SC018_kitchen_manager_page.dart';
import '../view/page/SC004_home_page.dart';
import '../view/page/sign_up_page.dart';
import '../view/page/SC001_login_page.dart';
import '../view/page/SC002_signup_page.dart';
import '../view/page/user_page.dart';
import '../view/widgets/base_scaffold.dart';
import 'router_key_management.dart';

class AppPath {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String signUpPhone = '/signUpPhone';
  static const String otp = '/otp';
  static const String home = '/';
  static const String favorite = '/favorite';
  static const String notification = '/notification';
  static const String user = '/user';
  static const String kitchenmap = '/kitchenmap';
  static const String orderdetail = '/orderdetail';
  static const String search = '/search';
  static const String mealdetail = '/mealdetail';
  static const String order = '/order';
  static const String payment = '/payment';
  static const String kitchenhome = '/kitchenhome';
  static const String kitchenmanager = '/kitchenmanager';
  static const String adddish = '/adddish';
  static const String addtray = '/addtray';
  static const String addmeal = '/addmeal';
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppPath.login,
    navigatorKey: RouterKeyManager.instance.rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppPath.login,
        builder: (
          context,
          state,
        ) =>
            const LoginPage(),
      ),
      GoRoute(
        path: AppPath.signUp,
        builder: (
          context,
          state,
        ) =>
            const SignUpPage(),
      ),
      GoRoute(
        path: AppPath.signUpPhone,
        builder: (
          context,
          state,
        ) =>
            const SignInPhonePage(),
      ),
      ShellRoute(
        navigatorKey: RouterKeyManager.instance.shellNavigatorKey,
        builder: (
          context,
          state,
          child,
        ) =>
            BaseScaffold(
          child: child,
        ),
        routes: [
          GoRoute(
            path: AppPath.home,
            builder: (
              context,
              state,
            ) =>
                const HomePage(),
          ),
          GoRoute(
            path: AppPath.favorite,
            builder: (
              context,
              state,
            ) =>
                const SizedBox(),
          ),
          GoRoute(
            path: AppPath.notification,
            builder: (
              context,
              state,
            ) =>
                const NotificationPage(),
          ),
          GoRoute(
            path: AppPath.user,
            builder: (
              context,
              state,
            ) =>
                const UserPage(),
          ),
          GoRoute(
              path: AppPath.kitchenmap,
              builder: (
                context,
                state,
              ) =>
                  const KitchenMapPage()),
        ],
      ),
      GoRoute(path: AppPath.orderdetail, builder: (context, state) => const OrderDetailPage()),
      GoRoute(path: '${AppPath.search}/:searchText', builder: (context, state) => SearchPage(searchText: state.pathParameters['searchText'] ?? '')),
      GoRoute(path: AppPath.mealdetail, builder: (context, state) => const MealDetail()),
      GoRoute(path: AppPath.order, builder: (context, state) => const OrderPage()),
      GoRoute(path: AppPath.payment, builder: (context, state) => const PaymentPage()),
      GoRoute(path: AppPath.kitchenhome, builder: (context, state) => const KitchenHome()),
      GoRoute(
        path: '${AppPath.kitchenmanager}/:tab',
        // path: AppPath.kitchenmanager,
        builder: (context, state) => KitchenManager(
          selectedTab: int.parse(state.pathParameters['tab'] ?? '0'),
        ),
      ),
      GoRoute(path: AppPath.adddish, builder: (context, state) => const AddDishPage()),
      GoRoute(path: AppPath.addtray, builder: (context, state) => const AddTrayPage()),
      GoRoute(path: AppPath.addmeal, builder: (context, state) => const AddMealPage()),
    ],
    debugLogDiagnostics: true,
  );
}
