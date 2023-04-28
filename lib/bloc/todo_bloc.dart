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
    listenTodo();
  }

  Future<void> addTodo(String text) async {
    await ref.watch(todoRepositoryProvider).add(text);
  }

  Future<void> deleteTodo(Todo todo) async {
    await ref.watch(todoRepositoryProvider).delete(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await ref.watch(todoRepositoryProvider).update(todo);
  }

  Future<void> listenTodo() async {
    final stodos = ref.watch(todoRepositoryProvider).listenTodoList();
    stodos.listen((todos) {
      state = TodoState.todos(todos);
    });
  }
}
