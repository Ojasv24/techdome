import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/todo_bloc.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoBlocProvider);
    final notifier = ref.watch(todoBlocProvider.notifier);

    return state.when(
        loading: () => const Center(
              child: Text('loading'),
            ),
        todos: (todos) => Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final text = todos[index].description;
                  final completed = todos[index].completed;
                  final controller = TextEditingController(text: text);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Checkbox(
                          onChanged: (value) {
                            notifier.toggle(todos[index]);
                          },
                          value: completed,
                        ),
                        Expanded(
                            child: Focus(
                          onFocusChange: (value) {
                            notifier.updateTodo(todos[index], controller.text);
                          },
                          child: TextField(
                            controller: TextEditingController(text: text),
                            onChanged: (value) {
                              controller.text = value;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontSize: 18,
                                decoration: completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              notifier.deleteTodo(todos[index]);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red[600],
                            )),
                      ]),
                    ),
                  );
                },
              ),
            ));
  }
}
