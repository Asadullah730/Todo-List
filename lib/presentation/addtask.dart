import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todolist.dart';

class AddtaskScreen extends StatelessWidget {
  final bool isEdit;
  final int index;
  final String task;
  final String des;
  final TodoController todoController = Get.find();

  AddtaskScreen({
    super.key,
    required this.isEdit,
    required this.index,
    required this.task,
    required this.des,
    required List todo,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set initial text values if editing
    titleController.text = task;
    desController.text = des;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Task" : "Add Task"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Task Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: desController,
                decoration: InputDecoration(
                  labelText: "Task Description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      desController.text.isNotEmpty) {
                    if (isEdit) {
                      todoController.editTask(
                        index,
                        titleController.text,
                        desController.text,
                      );
                    } else {
                      todoController.addTask(
                        titleController.text,
                        desController.text,
                      );
                    }
                    Get.back(); // Return to HomeScreen
                  } else {
                    Get.snackbar("Error", "Both fields are required");
                  }
                },
                child: Text(
                  isEdit ? "Update Task" : "Add Task",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
