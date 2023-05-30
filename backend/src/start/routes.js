import express from "express";
import cors from "cors";
import courseRouter from "../routes/course.route.js";
import regCourseRouter from "../routes/reg_course.route.js";
import semesterRouter from "../routes/semester.route.js";

export default function (app) {
  app.use(cors());
  app.use(express.json());
  app.use("/api/courses", courseRouter);
  app.use("/api/reg-courses", regCourseRouter);
  app.use("/api/semester", semesterRouter);
}
