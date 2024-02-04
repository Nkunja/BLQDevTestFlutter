import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_app/modules/initial.dart';
import 'chat_app/routes/app_pages.dart';
import 'chat_app/utils/languages/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'taskate',
          getPages: AppPages.routes,
          locale: const Locale('kr'),
          translations: AppLanguage(),
          initialBinding: InitialBindings(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initialPage,
          defaultTransition: Transition.fade,
        );
      },
    );
  }
}
