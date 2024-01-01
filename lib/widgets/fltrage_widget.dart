import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organisation_tache/controllers/tasks_controller.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool selected;

  const FilterButton({
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find(); // Trouver le contrôleur

    return Container(
      margin: EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          taskController.changeFilter(
              title); // Appeler la fonction de changement de filtre du contrôleur
        },
        style: ElevatedButton.styleFrom(
          primary: selected ? Colors.blue : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
