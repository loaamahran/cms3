import 'dart:convert';
import 'dart:developer';

import 'package:cms_final/data/apis/endpoints.dart';
import 'package:cms_final/data/models/course.dart';
import 'package:cms_final/data/models/semester.dart';
import 'package:http/http.dart';

class Repository {
  final Client _client;

  Repository(this._client);

  Future<List<Course?>> getCourses() async {
    const String url = EndPoints.getCourses;
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: EndPoints.headers,
      );

      if (response.statusCode == 200) {
        final List<Course> courses = [];
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        for (var element in data) {
          courses.add(Course.fromJson(element));
        }
        return courses;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> deleteCourse(Course course) async {
    final String url = EndPoints.deleteCourse + course.id;
    try {
      final response = await _client.delete(
        Uri.parse(url),
        headers: EndPoints.headers,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Course?>> getRegisteringCourses() async {
    const String url = EndPoints.getRegisteringCourses;
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: EndPoints.headers,
      );

      if (response.statusCode == 200) {
        final List<Course> courses = [];
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        for (var element in data) {
          courses.add(Course.fromJson(element));
        }
        return courses;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> registerCourse(Course course) async {
    final String url = EndPoints.registerCourse + course.id;
    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: EndPoints.headers,
        body: jsonEncode(course.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Semester>> getAllSemesters() async {
    const String url = EndPoints.getAllSemester;
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: EndPoints.headers,
      );

      if (response.statusCode == 200) {
        final List<Semester> semesters = [];
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        for (var element in data) {
          semesters.add(Semester.fromJson(element));
        }
        return semesters;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<Semester?> getSemesterById(String id) async {
    final String url = EndPoints.getSemester + id;
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: EndPoints.headers,
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        return Semester.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
