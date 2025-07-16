import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text.trim();

      // Aqui você pode chamar seu UseCase ou Controller para salvar
      print("Salvar tarefa: $title");

      Navigator.pop(context); // Volta para a tela anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título da tarefa'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Digite um título' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTask,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
