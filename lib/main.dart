
import 'package:firebase_core/firebase_core.dart';
import 'package:teaching_with_purpose_student/firebase_options.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  await initGetServices();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]);

  return runApp(GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: GetMaterialApp(
      defaultTransition: Transition.fade,
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      // translationsKeys: AppTranslation.translations,
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
    ),
  ));
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
