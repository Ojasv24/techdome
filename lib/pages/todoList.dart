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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    final text = todo.description;
                    final completed = todo.completed;
                    final controller = TextEditingController(text: text);
                    return Card(
                      color: Colors.white70,
                      shadowColor: Colors.blue.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              shape: const CircleBorder(),
                              onChanged: (value) {
                                notifier.toggle(todo);
                              },
                              value: completed,
                            ),
                          ),
                          Expanded(
                              child: Focus(
                            onFocusChange: (value) {
                              notifier.updateTodo(todo, controller.text);
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
                                  fontWeight: FontWeight.w600,
                                  decoration: completed
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          )),
                          IconButton(
                              onPressed: () {
                                notifier.deleteTodo(todo);
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
              ),
            ));
  }
}
