class TaskModel {
  String? taskId;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? iV;

  TaskModel(
      {this.taskId,
      this.image,
      this.title,
      this.desc,
      this.priority,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TaskModel.fromJson(Map<String, dynamic> json) {
    taskId = json['_id'];
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    priority = json['priority'];
    status = json['status'];
    userId = json['user'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = taskId;
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['priority'] = priority;
    data['status'] = status;
    data['user'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
