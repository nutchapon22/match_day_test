import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:match_day_test/controller/todo_con.dart';
import 'package:match_day_test/model/todo_model.dart';

class FormTodo extends ConsumerWidget {
  const FormTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int tid = ref.read(TodoProvider.notifier).state.length + 1;
    final taskController = TextEditingController();
    final descriptionController = TextEditingController();
    final deadlineController = TextEditingController();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "เพิ่มงานใหม่",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: "หัวข้อ",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "รายละเอียดงานที่ทำ",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: deadlineController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "ใส่วันและเวลาที่ต้องทำให้เสร็จ",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 1)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    final hour = pickedTime.hour.toString().padLeft(2, '0');
                    final minute = pickedTime.minute.toString().padLeft(2, '0');
                    final dateStr =
                        "${pickedDate.day.toString().padLeft(2, '0')}/"
                        "${pickedDate.month.toString().padLeft(2, '0')}/"
                        "${pickedDate.year}";
                    deadlineController.text = "$dateStr $hour:$minute";
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (taskController.text.isEmpty ||
                    descriptionController.text.isEmpty ||
                    deadlineController.text.isEmpty) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("ใส่ข้อมูลให้ครบถ้วน")),
                  );
                  return;
                }

                ref
                    .read(TodoProvider.notifier)
                    .addTodo(
                      Todo(
                        tid: tid,
                        task: taskController.text,
                        description: descriptionController.text,
                        deadline: deadlineController.text,
                        createdAt: DateTime.now().toString(),
                        isDone: false,
                      ),
                    );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add),
              label: const Text("เพิ่มงาน"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
