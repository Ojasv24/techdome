import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techdome/model/todo.dart';
part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState.loading() = Loading;
  factory TodoState.todos(List<Todo> todos) = Todos;
}
