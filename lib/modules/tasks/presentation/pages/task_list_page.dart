import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final Box<String> _box = Hive.box<String>('tarefas');
  List<String> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _tarefas = _box.values.toList();
  }

  void _adicionarTarefa(String tarefa) {
    setState(() {
      _tarefas.add(tarefa);
      _box.add(tarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: _tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa por enquanto'))
          : ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tarefas[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaTarefa = await Navigator.of(context).push<String>(
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          );
          if (novaTarefa != null && novaTarefa.isNotEmpty) {
            _adicionarTarefa(novaTarefa);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tarefa "$novaTarefa" adicionada!')),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nome da tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String nomeTarefa = _controller.text.trim();
                if (nomeTarefa.isNotEmpty) {
                  Navigator.of(context).pop(nomeTarefa);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
