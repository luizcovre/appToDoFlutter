import 'package:flutter/material.dart';
import 'modules/tasks/presentation/pages/task_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do Modularizado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TaskListPage(),
    );
  }
}
