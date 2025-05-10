class Todo {
  int? tid;
  String? task;
  String? description;
  bool? isDone;
  String? createdAt;
  String? deadline;

  Todo({
    this.tid,
    this.task,
    this.description,
    this.isDone,
    this.createdAt,
    this.deadline,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    tid = json['tid'];
    task = json['task'];
    description = json['description'];
    isDone = json['isDone'];
    createdAt = json['createdAt'];
    deadline = json['deadline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this.tid;
    data['task'] = this.task;
    data['description'] = this.description;
    data['isDone'] = this.isDone;
    data['createdAt'] = this.createdAt;
    data['deadline'] = this.deadline;
    return data;
  }
}
