import mongoose from "mongoose";

const regCourseSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 255,
  },
  code: {
    type: String,
    required: true,
    minlength: 1,
    maxlength: 255,
  },
  creditHours: {
    type: Number,
    required: true,
    min: 1,
  },
  perquisites: {
    type: [String],
    default: [],
    required: false,
  },
  maxEnrollments: {
    type: Number,
    required: true,
  },
  isRegistered: {
    type: Boolean,
    required: false,
    default: false,
  },
  grade: {
    type: String,
    required: false,
    default: "N/A",
  },
});

export const regSchema = regCourseSchema;
export const RegCourse = mongoose.model("RegCourse", regCourseSchema);
