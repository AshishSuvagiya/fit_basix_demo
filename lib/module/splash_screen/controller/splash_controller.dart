import 'package:fit_basix_demo/module/utils/navigation_utils/navigation.dart';
import 'package:fit_basix_demo/module/utils/navigation_utils/routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (value) {
        Navigation.pushNamed(Routes.exerciseScreen);
      },
    );
    super.onInit();
  }
}
