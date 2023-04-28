import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState.loading() = Loading;
  factory TodoState.todos() = Todos;
}
