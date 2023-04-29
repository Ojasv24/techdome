import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techdome/bloc/auth_bloc.dart';
import 'package:techdome/bloc/todo_bloc.dart';
import 'package:techdome/pages/todoList.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authBlocProvider.notifier);
    final todoNotifier = ref.watch(todoBlocProvider.notifier);
    TextEditingController? controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.note_alt_outlined),
        actions: [
          IconButton(
              onPressed: () {
                authNotifier.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('Todos'),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TodoList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Add new todo....',
                          filled: true,
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        todoNotifier.addTodo(controller.text);
                        controller.text = '';
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
