import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techdome/model/todo.dart';
import 'package:techdome/model/todo_state.dart';
import 'package:techdome/repository/todo_repository.dart';

part 'todo_bloc.g.dart';

@riverpod
class TodoBloc extends _$TodoBloc {
  @override
  TodoState build() {
    init();
    return TodoState.loading();
  }

  Future<void> init() async {
    state = TodoState.loading();
    final todos = ref.watch(todoRepositoryProvider).listenTodoList();
    state = TodoState.todos();
  }

  Future<void> addTodo(String text) async {
    state = TodoState.loading();
    await ref.watch(todoRepositoryProvider).add(text);
    state = TodoState.todos();
  }

  Future<void> deleteTodo(Todo todo) async {
    state = TodoState.loading();
    await ref.watch(todoRepositoryProvider).delete(todo);
    state = TodoState.todos();
  }

  Future<void> updateTodo(Todo todo) async {
    state = TodoState.loading();
    await ref.watch(todoRepositoryProvider).update(todo);
    state = TodoState.todos();
  }
}
