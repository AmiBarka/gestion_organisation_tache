// add_task_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organisation_tache/controllers/ajou_tasks_controller.dart';
import 'package:organisation_tache/widgets/constance.dart';
//import 'package:organisation_tache/widgets/custom_button_widget.dart';

class AddTaskScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TaskController1 taskController1 = Get.put(TaskController1());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController progressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    taskController1.selectedTaskType.value = taskController1.taskTypes.first;
    taskController1.selectedTaskState.value = taskController1.taskStates.first;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assest/images/s.jpg'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bonjour",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          _auth.currentUser?.email ?? "Guest",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 60),
                const Text(
                  "Créez une nouvelle tâche",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                _buildDropdown(
                  label: "Type",
                  value: taskController1.selectedTaskType.value,
                  onChanged: (value) {
                    taskController1.selectedTaskType.value = value!;
                  },
                  items: taskController1.taskTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                ),
                SizedBox(height: 20),
                _buildTextField("Titre", titleController),
                SizedBox(height: 20),
                _buildDateRow(
                  labelText1: 'Date de début',
                  labelText2: 'Date de fin',
                  controller1: startDateController,
                  controller2: endDateController,
                ),
                SizedBox(height: 20),
                _buildStateAndProgressRow(
                  stateValue: taskController1.selectedTaskState.value,
                  progressValue: progressController.text,
                  onStateChanged: (value) {
                    taskController1.selectedTaskState.value = value!;
                  },
                  onProgressChanged: (value) {
                    progressController.text = value!;
                  },
                ),
                SizedBox(height: 38),
                ElevatedButton(
                  onPressed: () {
                    _addTask();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Creer une tâche',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required Function(String?) onChanged,
    required List<DropdownMenuItem<String>> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 218, 218, 218),
          ),
          value: value,
          onChanged: onChanged,
          items: items,
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 218, 218, 218),
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow({
    required String labelText1,
    required String labelText2,
    required TextEditingController controller1,
    required TextEditingController controller2,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: controller1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 218, 218),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: controller2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 218, 218),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStateAndProgressRow({
    required String stateValue,
    required String progressValue,
    required Function(String?) onStateChanged,
    required Function(String?) onProgressChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'État',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 218, 218),
                ),
                value: stateValue,
                onChanged: onStateChanged,
                items: taskController1.taskStates
                    .map((state) => DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Avancement',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: progressController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 218, 218),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _addTask() {
    double progressValue = double.tryParse(progressController.text) ?? 0.0;

    Map<String, dynamic> taskData = {
      'type': taskController1.selectedTaskType.value,
      'title': titleController.text,
      'startDate': startDateController.text,
      'endDate': endDateController.text,
      'state': taskController1.selectedTaskState.value,
      'progress': progressValue,
    };

    taskController1.addTask(taskData);
    Get.back(); // Navigate back after adding task
  }
}
