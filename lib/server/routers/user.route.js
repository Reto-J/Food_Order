const express = require("express");
const User = require("../modules/user.modules.js");
const route = express.Router();
const {getUsers, getUserById, postUser, deleteUser, updateUser, getRestaurants, logIn, deleteAll} = require("../controllers/users.controllers.js");
const auth = require("../middleware/auth.middleware.js");

route.get("/",getUsers);

route.get("/me",auth, getUserById);

route.post("/", postUser);

route.delete("/:id",auth, deleteUser);

route.put("/:id",auth, updateUser);

route.post("/login", logIn);

route.get("/route/:route", getRestaurants);

route.delete("/",auth, deleteAll);


module.exports = route;