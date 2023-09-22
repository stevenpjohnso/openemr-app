import 'package:openemr/app/modules/home/home_binding.dart';
import 'package:openemr/app/modules/home/home_page.dart';
import 'package:openemr/app/modules/login/login_binding.dart';
import 'package:openemr/app/modules/login/login_page.dart';
import 'package:openemr/app/modules/profile/profile_binding.dart';
import 'package:openemr/app/modules/profile/profile_page.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_page.dart';
import 'package:get/get.dart';
import 'package:openemr/app/routes/app_routes.dart';


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
      name: AppRoutes.signup,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
