class EndPoints {
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  //* Courses
  static const String base = "http://localhost:3000/api";
  static const String getRegisteringCourses = "$base/reg-courses/all";
  static const String registerCourse = "$base/reg-courses/register/";
  static const String getCourses = "$base/courses/all";
  static const String deleteCourse = "$base/courses/delete/";

  //* Semesters
  static const String getSemester = "$base/semester/";
  static const String getAllSemester = "$base/semester/all";
}
