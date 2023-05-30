class Course {
  final String id;
  final String name;
  final List<dynamic> perquisites;
  final int creditHours;
  final String grade;
  String? code;

  Course({
    required this.id,
    required this.name,
    required this.perquisites,
    required this.creditHours,
    required this.grade,
    this.code,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      name: json['name'],
      perquisites: json['perquisites'],
      creditHours: json['creditHours'],
      grade: json['grade'],
      code: json['code'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'perquisites': perquisites,
      'creditHours': creditHours,
      'grade': grade,
      'code': code,
    };
  }

  Course copyWith({
    String? id,
    String? name,
    List<String>? perquisites,
    int? creditHours,
    String? grade,
    String? code,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      perquisites: perquisites ?? this.perquisites,
      creditHours: creditHours ?? this.creditHours,
      grade: grade ?? this.grade,
      code: code ?? this.code,
    );
  }
}
