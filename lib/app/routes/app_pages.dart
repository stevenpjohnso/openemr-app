import 'package:openemr/app/modules/home/home_binding.dart';
import 'package:openemr/app/modules/home/home_page.dart';
import 'package:openemr/app/modules/login/login_binding.dart';
import 'package:openemr/app/modules/login/login_page.dart';
import 'package:openemr/app/modules/profile/profile_binding.dart';
import 'package:openemr/app/modules/profile/profile_page.dart';
import 'package:openemr/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
