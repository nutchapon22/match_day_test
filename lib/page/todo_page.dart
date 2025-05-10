import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_day_test/controller/todo_con.dart';
import 'package:match_day_test/widget/Todo_card.dart';
import 'package:match_day_test/widget/form.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  @override
  Widget build(BuildContext context) {
    late final todos = ref.watch(TodoProvider);
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return TodoCard(
                    otherMode: false,
                    tid: todos[index].tid!,
                    task: todos[index].task!,
                    createAt: todos[index].createdAt!,
                    deadline: todos[index].deadline!,
                    description: todos[index].description!,
                    isDone: todos[index].isDone!,
                    onDelete: () {
                      ref
                          .read(TodoProvider.notifier)
                          .removeTodo(todos[index].tid!);
                    },
                    onComplete: () {
                      ref
                          .read(TodoProvider.notifier)
                          .completeTodo(todos[index].tid!);
                      print(todos[index].isDone);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return FormTodo();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
