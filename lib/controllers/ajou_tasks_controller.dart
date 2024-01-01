// task_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organisation_tache/service/ajou_service_tasks.dart';

class TaskController1 extends GetxController {
  final TaskService _taskService = TaskService();
  final RxBool isLoading = true.obs;
  final RxString selectedTaskType = ''.obs;
  final RxString selectedTaskState = ''.obs;

  final List<String> taskTypes = ['Personnel', 'Scolaire'];
  final List<String> taskStates = ['En progress', 'A faire', 'Terminer'];

  Future<void> addTask(Map<String, dynamic> taskData) async {
    try {
      isLoading.value = true;
      await _taskService.addTask(taskData);
    } catch (error) {
      print("Error adding task: $error");
      Get.snackbar(
        'Error',
        'Failed to add task. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
