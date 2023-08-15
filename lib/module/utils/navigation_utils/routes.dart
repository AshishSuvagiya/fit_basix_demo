import 'package:fit_basix_demo/module/exercise_screen/presentation/exercise_screen.dart';
import 'package:fit_basix_demo/module/splash_screen/presentation/splash_screen.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const String splash = '/splash';
  static const String exerciseScreen = '/exerciseScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: exerciseScreen,
      page: () => ExerciseScreen(),
      transition: defaultTransition,
    ),
  ];
}
