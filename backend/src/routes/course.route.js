import express from "express";
import { RegCourse } from "../models/reg_course.model.js";

const router = express.Router();

router.get("/all", async (req, res) => {
  const courses = await RegCourse.find({ isRegistered: true });
  res.json(courses);
});

router.delete("/delete/:_id", async (req, res) => {
  try {
    const regCourse = await RegCourse.findById(req.params._id);
    if (!regCourse) return res.status(404).send("Course not found");
    regCourse.isRegistered = false;
    await regCourse.save();
    res.send(regCourse);
  } catch (e) {
    res.status(400).send(e);
  }
});

export default router;
