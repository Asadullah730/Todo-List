import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todolist.dart';
import 'package:todolist/presentation/addtask.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO List", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        print("Task list: ${todoController.tasks}");
        return todoController.tasks.isEmpty
            ? const Center(child: Text("No tasks available"))
            : ListView.builder(
              itemCount: todoController.tasks.length,
              itemBuilder: (context, index) {
                var task = todoController.tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(task['task'] ?? ''),
                    subtitle: Text(task['des'] ?? ''),
                    leading: IconButton(
                      onPressed: () {
                        todoController.deleteTask(index);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min, // ✅ THIS FIXES THE ISSUE
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(
                              () => AddtaskScreen(
                                isEdit: true,
                                index: index,
                                task: task['task']!,
                                des: task['des']!,
                                todo: [],
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => AddtaskScreen(
              isEdit: false,
              index: -1,
              task: '',
              des: '',
              todo: [],
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
