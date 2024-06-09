class TaskRequestModel {
  final String image, title, desc, priority;
  final String? dueDate, status, userId;

  const TaskRequestModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    this.dueDate,
    this.status,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['priority'] = priority;
    data['dueDate'] = dueDate;
    data['status'] = status;
    data['user'] = userId;
    return data;
  }
}
