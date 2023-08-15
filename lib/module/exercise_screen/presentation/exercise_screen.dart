import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_basix_demo/module/exercise_screen/controller/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({Key? key}) : super(key: key);
  final ExerciseController exerciseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.4),
        appBar: AppBar(
          title: const Text("Fit Basix Demo"),
          centerTitle: true,
          elevation: 0.00,
          backgroundColor: Colors.greenAccent[400],
        ),
        body: Obx(
          () => exerciseController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 1.5,
                  ),
                )
              : ListView.builder(
                  itemCount: exerciseController.allExercise.value.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Equipment : ${exerciseController.allExercise.value[index].equipment ?? ""}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Target : ${exerciseController.allExercise.value[index].target ?? ""}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CachedNetworkImage(
                                imageUrl: exerciseController.allExercise.value[index].gifUrl ?? "",
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                placeholder: (context,url) => CircularProgressIndicator(),
                                errorWidget: (context,url,error) => new Icon(Icons.error),
                              ),
                              // Center(
                              //   child: Image.network(
                              //     exerciseController
                              //             .allExercise.value[index].gifUrl ??
                              //         "",
                              //     width: 300,
                              //     height: 200,
                              //     fit: BoxFit.contain,
                              //   ),
                              // ),
                              Text(
                                "Name : ${exerciseController.allExercise.value[index].name ?? ""}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "BodyPart : ${exerciseController.allExercise.value[index].bodyPart ?? ""}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
