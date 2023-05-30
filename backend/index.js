import express from "express";
import startDB from "./src/start/db.js";
import startRoutes from "./src/start/routes.js";

startDB();
const app = express();
startRoutes(app);

const PORT = 3000 || 3001;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});

app.get("/", (req, res) => {
  res.send("Root");
});
