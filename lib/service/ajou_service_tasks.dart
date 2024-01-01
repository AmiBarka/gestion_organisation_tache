// task_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  final CollectionReference _tasksCollection =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(Map<String, dynamic> taskData) async {
    await _tasksCollection.add(taskData);
  }
}
