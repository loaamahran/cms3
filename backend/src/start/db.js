import mongoose from "mongoose";
import dotenv from "dotenv";
dotenv.config();

const DATABASE_NAME = "CMSS" || "cms-development";

const MONGO_NAME = "ahmedyousry200174";
const MONGO_SECRET = "hzc2VA5LqGs91hFl";

const DB_URL = `mongodb+srv://ahmedyousry200174:hzc2VA5LqGs91hFl@cluster0.yezocuu.mongodb.net/CMSS?retryWrites=true&w=majority`;

export default function () {
  mongoose
    .connect(DB_URL)
    .then(() => {
      console.log("Database connected successfully");
    })
    .catch((err) => {
      console.log(err);
    });
}

export const database = mongoose;
