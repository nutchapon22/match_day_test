import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_day_test/controller/todo_con.dart';
import 'package:match_day_test/widget/Todo_card.dart';

class DonePage extends ConsumerStatefulWidget {
  const DonePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DonePageState();
}

class _DonePageState extends ConsumerState<DonePage> {
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
                itemCount: todos.where((todo) => todo.isDone == true).length,
                itemBuilder: (context, index) {
                  return TodoCard(
                    otherMode: true,
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
    );
  }
}
