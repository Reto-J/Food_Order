const express = require("express");
const User = require("../modules/user.modules.js");
const route = express.Router();
const {getUsers, getUserById, postUser, deleteUser, updateUser, getRestaurants, logIn} = require("../controllers/users.controllers.js")

route.get("/",getUsers);

route.get("/:id", getUserById);

route.post("/", postUser);

route.delete("/:id", deleteUser);

route.put("/:id", updateUser);

route.post("/login", logIn);

route.get("/route/:route", getRestaurants);


module.exports = route;