import 'package:get/get.dart';
import 'package:organisation_tache/models/list_tasks_models.dart';
import 'package:organisation_tache/service/task_service.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  var tasks = <Task>[].obs;
  var selectedFilter = 'En progress'.obs; // Filtre par défaut

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      // Utilisation du service pour récupérer les tâches en fonction du filtre
      tasks.value = await TaskService().getTasksByFilter(selectedFilter.value);
    } finally {
      isLoading(false);
    }
  }

  void changeFilter(String newFilter) {
    selectedFilter.value = newFilter;
    fetchData(); // Met à jour les tâches en fonction du nouveau filtre
  }
}
