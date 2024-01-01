import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organisation_tache/controllers/tasks_controller.dart';
import 'package:organisation_tache/screens/atouter_tasks.dart';
import 'package:organisation_tache/widgets/constance.dart';
import 'package:organisation_tache/widgets/fltrage_widget.dart';
import 'package:organisation_tache/widgets/page_home_widget.dart';

class HomePage extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assest/images/s.jpg'), // Assurez-vous que le chemin de l'image est correct
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bonjour",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        _auth.currentUser?.email ?? "Guest",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Taper le nom d’une tâche',
                        filled: true,
                        fillColor: Color.fromARGB(255, 218, 218, 218),
                        prefixIcon: Icon(
                            Icons.search), // Ajoutez l'icône de recherche ici
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      "Mes tâches",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        FilterButton(
                          title: 'En progress',
                          selected: taskController.selectedFilter.value ==
                              'En progress',
                        ),
                        FilterButton(
                          title: 'A faire',
                          selected:
                              taskController.selectedFilter.value == 'A faire',
                        ),
                        FilterButton(
                          title: 'Terminer',
                          selected:
                              taskController.selectedFilter.value == 'Terminer',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () {
                        print("isLoading: ${taskController.isLoading.value}");
                        if (taskController.isLoading.value) {
                          return CircularProgressIndicator();
                        } else {
                          return Expanded(
                            child: ListView(
                              children: taskController.tasks.map((task) {
                                return TaskItem(
                                  type: task.type,
                                  title: task.title,
                                  progress: task.progress,
                                  startDate: task.startDate,
                                  endDate: task.endDate,
                                  state: task.state,
                                );
                              }).toList(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddTaskScreen());
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
