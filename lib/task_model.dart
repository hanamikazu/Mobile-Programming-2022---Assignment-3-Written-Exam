class Task{
  final int? id;
  final String title;
  final String details;

  const Task({required this.title, required this.details, this.id});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    details: json['details']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'details' :details
  };
}