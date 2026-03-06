const express = require("express");
require("dotenv").config();
const http = require("http");
const app = express();
const mongoose = require("mongoose");
const User = require("./modules/user.modules.js");
const restaurantRoute = require("./routers/restaurant.route.js");
const userRoute = require("./routers/user.route.js");
const cors = require("cors");
const { Server } = require("socket.io");
const { v4 : uuidv4 } = require("uuid");

const server = http.createServer(app);

//middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//routes
app.use("/api/reto/order/users", userRoute);
app.use("/api/reto/order/restaurants", restaurantRoute);
// app.use("/api/reto/order/foods", foodRoute);

// --- WebSocket setup ---
const io = new Server(server, {
  cors: {
    origin: "*", // allow all origins for now
    methods: ["GET", "POST"],
  },
});

let users = {};

// --- Socket.io connection ---
io.on("connection", (socket) => {
  const userId = socket.handshake.query.userId;
  const role = socket.handshake.query.role;
  
  console.log(`${role} connected: ${userId}`);

  socket.join(userId);

  socket.on("createOrder", (data) => {
    const { customerId, restaurantId } = data;
    const orderId = "order_" + uuidv4();

    console.log(`New order created ${orderId}`);

    socket.join(orderId);

    io.to(restaurantId).emit("orderCreated", {orderId});
  });

  socket.on("restaurantJoinOrder", ({orderId}) => {
    socket.join(orderId);
    console.log("Restaurant joined order room: ", orderId)
  });

  socket.on("updateOrderStatus", ({ orderId, stat }) => { 
    io.to(orderId).emit("orderStatusUpdated", { orderId, stat })
  });

  socket.on("disconnect", ()=> {
    console.log("Disconnected :", userId)
  });

});

mongoose
  .connect(
    "mongodb+srv://Reto:dragonChoice%233H@cluster0.yccruub.mongodb.net/?appName=Cluster0",
  )
  .then(() => {
    console.log("Connected to Database!");
    app.listen(8000, "0.0.0.0", (req, res) => {
      // res.json({message : "Server on"});
      console.log("Server running on port 8000");
    });
  })
  .catch((err) => {
    console.log("Connection Failed!", err);
  });
