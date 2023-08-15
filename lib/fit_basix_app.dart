import 'package:fit_basix_demo/module/exercise_screen/controller/exercise_controller.dart';
import 'package:fit_basix_demo/module/splash_screen/controller/splash_controller.dart';
import 'package:fit_basix_demo/module/utils/navigation_utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FitBasixApp extends StatefulWidget {
  const FitBasixApp({Key? key}) : super(key: key);

  @override
  FitBasixAppState createState() => FitBasixAppState();
}

class FitBasixAppState extends State<FitBasixApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: "Fit Basix",
      initialBinding: AppBinding(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.black),
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        brightness: Brightness.light,
        primaryColor: Colors.black,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        unselectedWidgetColor: Colors.transparent,
        canvasColor: Colors.white,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.pages,
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {},
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            ),
          ),
        );
      },
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
    Get.put<ExerciseController>(ExerciseController());
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
