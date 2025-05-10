import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_day_test/model/todo_model.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(int tid) {
    state = state.where((todo) => todo.tid != tid).toList();
  }

  void completeTodo(int tid) {
    state =
        state.map((todo) {
          if (todo.tid == tid) {
            return Todo(
              tid: todo.tid,
              task: todo.task,
              description: todo.description,
              isDone: !(todo.isDone ?? false),
              createdAt: todo.createdAt,
              deadline: todo.deadline,
            );
          }
          return todo;
        }).toList();
  }
}

final TodoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);
