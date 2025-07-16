import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: const Center(
        child: Text('Nenhuma tarefa por enquanto'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para tela de adicionar tarefa (em breve)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
  