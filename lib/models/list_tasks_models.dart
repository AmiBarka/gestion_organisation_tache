class Task {
  final String type;
  final String title;
  final String startDate;
  final String endDate;
  final String state;
  final double progress;

  Task({
    required this.type,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.state,
    required this.progress,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      type: json['type'],
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      state: json['state'],
      progress: (json['progress'] ?? 0).toDouble(),
    );
  }
}
