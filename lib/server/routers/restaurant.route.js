const express = require("express");
const Restaurant = require("../modules/restaurants.modules.js");
const route = express.Router();
const { getRestaurants,  getRestaurantById, postRestaurant,deleteRestaurant, updateRestaurant, logIn, deleteAll} = require("../controllers/restaurant.controller.js");
const auth = require("../middleware/auth.middleware.js");

route.get("/",getRestaurants);

route.get("/me",auth,  getRestaurantById);

route.post("/", postRestaurant);

route.delete("/me",auth, deleteRestaurant);

route.put("/me",auth, updateRestaurant);

route.post("/login", logIn);

route.delete("/", deleteAll);


module.exports = route;