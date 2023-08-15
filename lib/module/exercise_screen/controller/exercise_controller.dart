import 'dart:convert';

import 'package:fit_basix_demo/module/exercise_screen/model/exercise_model.dart';
import 'package:fit_basix_demo/module/utils/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ExerciseController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ExerciseModel> allExercise = <ExerciseModel>[].obs;

  Future<void> createBusiness() async {
    isLoading.value = true;
    final headers = {
      "X-RapidAPI-Key": 'c25f685c3amsh8a86c30f29cece1p163037jsn51e08295ad62'
    };
    var result = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.exercise),
      headers: headers,
    );
    allExercise.value = jsonDecode(result.body)
        .map((item) => ExerciseModel.fromJson(item))
        .toList()
        .cast<ExerciseModel>();
    isLoading.value = false;
  }

  @override
  void onInit() {
    createBusiness();
    super.onInit();
  }
}
