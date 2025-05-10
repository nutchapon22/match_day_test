import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.tid,
    required this.task,
    required this.createAt,
    required this.deadline,
    required this.description,
    required this.onDelete,
    required this.onComplete,
    required this.isDone,
    required this.otherMode,
  });
  final int tid;
  final String task;
  final String createAt;
  final String deadline;
  final String description;
  final bool isDone;
  final bool otherMode;
  final Function() onDelete;
  final Function() onComplete;

  @override
  Widget build(BuildContext context) {
    final createdDate = DateTime.tryParse(createAt);
    final formattedCreateAt =
        createdDate != null
            ? "${createdDate.day.toString().padLeft(2, '0')}/"
                "${createdDate.month.toString().padLeft(2, '0')}/"
                "${createdDate.year} ${createdDate.hour.toString().padLeft(2, '0')}:"
                "${createdDate.minute.toString().padLeft(2, '0')}"
            : createAt;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "เริ่ม: $formattedCreateAt",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "สิ้นสุด: $deadline",
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                  const SizedBox(height: 8),
                  Text("รายละเอียด: $description"),
                  const SizedBox(height: 8),
                  Text(
                    isDone ? "✔ เสร็จแล้ว" : "✘ ยังไม่เสร็จ",
                    style: TextStyle(
                      fontSize: 15,
                      color: isDone ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                if (!otherMode)
                  IconButton(
                    icon:
                        isDone
                            ? const Icon(Icons.close)
                            : const Icon(Icons.check),
                    color: isDone ? Colors.red : Colors.green,
                    onPressed: onComplete,
                  ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
