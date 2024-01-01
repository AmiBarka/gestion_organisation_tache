// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:organisation_tache/models/list_tasks_models.dart';

// class TaskService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Task>> getTasks() async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await _firestore.collection('tasks').get();

//     List<Task> tasks =
//         querySnapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();

//     return tasks;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organisation_tache/models/list_tasks_models.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Task>> getTasksByFilter(String filter) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('tasks')
        .where('state', isEqualTo: filter)
        .get();

    List<Task> tasks =
        querySnapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();

    return tasks;
  }

  addTask(Map<String, dynamic> taskData) {}
}
