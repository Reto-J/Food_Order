const Restaurant = require("../modules/restaurants.modules.js");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const getRestaurants = async (req, res) => {
  try {
    const restaurants = await Restaurant.find({});
    res.status(200).json(restaurants);
  } catch (error) {
    res.status(500).json({ message: error.message });
    console.log(error);
  }
};

const getRestaurantById = async (req, res) => {
  try {
    const id = req.userId;
    const restaurants = await Restaurant.findById(id);

    if (!restaurants) {
      return res.status(404).json({ message: "User does not exist" });
    }

    res.status(200).json(restaurants);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const logIn = async (req, res) => {
  try {
    const { email, password } = req.body;

    const restaurants = await Restaurant.findOne({ email });

    if (!restaurants) {
      return res.status(202).json({
        message: "Incorrect email or password // user not registered",
      });
    }

    const isPasswordCorrect = await bcrypt.compare(
      password,
      restaurants.password,
    );

    if (!isPasswordCorrect) {
      return res.status(201).json({
        message: "Invalid email or password",
      });
    } else {
      const token = jwt.sign(
        { userId: restaurants._id },
        process.env.JWT_SECRET,
        {
          expiresIn: "180d",
        },
      );
      return res.status(200).json({ token, role: restaurants.role });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const postRestaurant = async (req, res) => {
  try {
    const { email } = req.body;
    const existingRest = await Restaurant.findOne({ email });

    if (existingRest) {
      return res.status(201).json({ message: "User already exists" });
    } else {
      const restaurant = await Restaurant.create(req.body);
      const token = jwt.sign({ userId: restaurant._id }, process.env.JWT_SECRET, {
        expiresIn: "7d",
      });
      res.status(200).json({ token });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const deleteRestaurant = async (req, res) => {
  try {
    const id = req.userId;
    const restaurant = await Restaurant.findByIdAndDelete(id);

    if (!restaurant) {
      return res.status(404).json({ message: "User does not exist" });
    }

    res.status(200).json({ message: "User deleted sucessfully" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const updateRestaurant = async (req, res) => {
  try {
    const id = req.userId;
    const restaurant = await Restaurant.findByIdAndUpdate(id, req.body);

    if (!restaurant) {
      return res.status(202).json({ message: "User does not exist" });
    }

    const updatedRest = await Restaurant.findById(id);

    res.status(200).json(updatedRest);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const deleteAll = async (req, res) => {
  try {
    const restaurant = Restaurant.findByIdAndDelete({});
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getRestaurants,
  getRestaurantById,
  postRestaurant,
  deleteRestaurant,
  deleteAll,
  updateRestaurant,
  logIn,
};
