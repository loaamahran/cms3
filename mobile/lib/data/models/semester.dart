import 'package:cms_final/data/models/course.dart';

class Semester {
  final String name;
  final List<Course> courses;
  final String grade;
  final double gpa;

  const Semester({
    required this.courses,
    required this.name,
    required this.grade,
    required this.gpa,
  });

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => Course.fromJson(e))
          .toList(),
      name: json['name'] as String,
      grade: json['grade'] as String,
      gpa: json['gpa'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courses': courses,
      'semesterName': name,
      'grade': grade,
      'gpa': gpa,
    };
  }

  Semester copyWith({
    List<Course>? courses,
    String? name,
    String? grade,
    double? gpa,
  }) {
    return Semester(
      courses: courses ?? this.courses,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      gpa: gpa ?? this.gpa,
    );
  }
}
