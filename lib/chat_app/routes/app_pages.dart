import 'package:get/get.dart';

import 'app_routes.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';


class AppPages {
  static const initialPage = Paths.splashScreen;

  static final routes = [
    GetPage(
      name: Paths.splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Paths.chatScreen,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
