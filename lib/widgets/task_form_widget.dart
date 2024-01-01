// task_form_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organisation_tache/controllers/ajou_tasks_controller.dart';

class TaskFormWidget extends StatelessWidget {
  final TaskController1 taskController1 = Get.put(TaskController1());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController progressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _addTask();
          },
          child: Text('Ajouter la tâche'),
        ),
      ],
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
              Text(
                'État',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
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
              Text(
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
    Map<String, dynamic> taskData = {
      'type': taskController1.selectedTaskType.value,
      'title': titleController.text,
      'startDate': startDateController.text,
      'endDate': endDateController.text,
      'state': taskController1.selectedTaskState.value,
      'progress': progressController.text,
    };

    taskController1.addTask(taskData);
    Get.back(); // Navigate back after adding task
  }
}
