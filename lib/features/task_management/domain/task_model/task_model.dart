class TaskModel {
   String title;
   String description;
  final String date;
  final String? id;
  final String priority;
  final bool isComplete;

  //<editor-fold desc="Data Methods">
   TaskModel({
    required this.title,
    required this.description,
    required this.date,
    this.id,
    required this.priority,
    this.isComplete = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          date == other.date &&
          id == other.id &&
          priority == other.priority &&
          isComplete == other.isComplete);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      date.hashCode ^
      id.hashCode ^
      priority.hashCode ^
      isComplete.hashCode;

  @override
  String toString() {
    return 'TaskModel{' +
        ' title: $title,' +
        ' description: $description,' +
        ' date: $date,' +
        ' id: $id,' +
        ' priority: $priority,' +
        ' isComplete: $isComplete,' +
        '}';
  }

  TaskModel copyWith({
    String? title,
    String? description,
    String? date,
    String? id,
    String? priority,
    bool? isComplete,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      id: id ?? this.id,
      priority: priority ?? this.priority,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'priority': priority,
      'isComplete': isComplete,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      id: map['id'] as String,
      priority: map['priority'] as String,
      isComplete: map['isComplete'] as bool,
    );
  }

  //</editor-fold>
}
