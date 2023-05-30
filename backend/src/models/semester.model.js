import mongoose from "mongoose";
import { regSchema } from "./reg_course.model.js";
const semesterSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  courses: {
    type: [regSchema],
    ref: "RegCourse",
    required: true,
  },
  grade: {
    type: String,
    required: false,
  },
  gpa: {
    type: Number,
    required: false,
  },
});

export const Semester = mongoose.model("Semester", semesterSchema);
