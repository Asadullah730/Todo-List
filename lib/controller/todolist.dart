import 'package:get/get.dart';

class TodoController extends GetxController {
  var tasks =
      <Map<String, String>>[
        {'task': 'Task 1', 'des': 'Description 1'},
        {'task': 'Task 2', 'des': 'Description 2'},
        {'task': 'Task 3', 'des': 'Description 3'},
        {'task': 'Task 4', 'des': 'Description 4'},
        {'task': 'Task 5', 'des': 'Description 5'},
        {'task': 'Task 6', 'des': 'Description 6'},
        {'task': 'Task 7', 'des': 'Description 7'},
        {'task': 'Task 8', 'des': 'Description 8'},
        {'task': 'Task 9', 'des': 'Description 9'},
        {'task': 'Task 10', 'des': 'Description 10'},
      ].obs;

  void addTask(String task, String des) {
    tasks.add({'task': task, 'des': des});
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void updateTask(int index, String task, String des) {
    tasks[index] = {'task': task, 'des': des};
  }

  void editTask(int index, String newTask, String newDes) {
    tasks[index] = {'task': newTask, 'des': newDes};
  }
}
