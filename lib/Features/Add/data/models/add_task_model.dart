class AddTaskModel {
  final String image, title, desc, priority, dueDate;

  const AddTaskModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['priority'] = priority;
    data['dueDate'] = dueDate;
    return data;
  }
}
