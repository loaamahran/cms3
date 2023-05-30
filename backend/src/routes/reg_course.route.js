import express from "express";
import { RegCourse } from "../models/reg_course.model.js";

const router = express.Router();

router.get("/all", async (req, res) => {
  const regCourses = await RegCourse.find({ isRegistered: false });
  res.json(regCourses);
});

router.post("/register/:_id", async (req, res) => {
  const regCourse = await RegCourse.findById(req.params._id);
  if (!regCourse) return res.status(404).send("Course not found");

  try {
    regCourse.isRegistered = true;
    await regCourse.save();
    res.send(regCourse);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.post("/add", async (req, res) => {
  try {
    const regCourse = new RegCourse(req.body);
    await regCourse.save();
    res.send(regCourse);
  } catch (e) {
    res.status(400).send(e);
  }
});

export default router;
