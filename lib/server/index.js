const express = require("express");
const app = express();
const mongoose = require("mongoose");
const User = require("./modules/user.modules.js");
const userRoute = require("./routers/user.route.js");
// const cors = require("cors");

//middleware
// app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//routes
app.use("/api/reto/order/users", userRoute);
// app.use("/api/reto/order/foods", foodRoute);

mongoose
  .connect(
    "mongodb+srv://Reto:dragonChoice%233H@cluster0.yccruub.mongodb.net/?appName=Cluster0"
  )
  .then(() => {
    console.log("Connected to Database!");
    app.listen(8000, (req, res) => {
      // res.json({message : "Server on"});
      console.log("Server running on port 8000");
    });
  })
  .catch((err) => {
    console.log("Connection Failed!", err);
  });
