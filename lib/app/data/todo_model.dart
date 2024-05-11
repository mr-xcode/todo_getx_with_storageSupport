class Todo {
  String title;
  bool isDone;

  Todo({required this.title, required this.isDone});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(title: json['title'], isDone: json['isDone']);

  Map<String, dynamic> toJson() => {'title': title, 'isDone': isDone};
}
