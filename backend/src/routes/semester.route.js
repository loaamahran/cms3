import express from "express";
import { Semester } from "../models/semester.model.js";

const router = express.Router();

router.get("/all", async (req, res) => {
  const semesters = await Semester.find();
  res.json(semesters);
});

router.get("/:_id", async (req, res) => {
  try {
    const semester = await Semester.findOne({ _id: req.params._id });
    if (!semester) return res.status(404).send("Semester not found");
    res.json(semester);
  } catch (e) {
    res.status(400).send(e);
  }
});

router.post("/add", async (req, res) => {
  try {
    const semester = Semester(req.body);
    await semester.save();
    res.send(semester);
  } catch (e) {
    res.status(400).send(e);
  }
});

export default router;
