import 'package:cms_final/data/models/course.dart';
import 'package:cms_final/data/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class CoursesStateNotifier extends StateNotifier<List<Course>> {
  final repo = Repository(Client());

  CoursesStateNotifier() : super(const []);

  void update(Course course) {
    state = state
        .map(
          (thisCourse) => thisCourse,
        )
        .toList();
  }

  Future<List<Course?>> getCourses() async {
    return repo.getCourses();
  }

  Future<bool> registerCourse(Course course) async {
    return repo.registerCourse(course);
  }

  Future<bool> deleteCourse(Course course) async {
    if (await repo.deleteCourse(course)) {
      state = state.map((thisCourse) => course).toList();
      return true;
    }
    return false;
  }
}
