const mongoose = require("mongoose");
const FoodSchema = mongoose.Schema(
    {
        restaurantId :{
            type : String,
            required : true
        },
        foodName : {
            type : String,
            required : true
        },
        quantityAvail : {
            type : Number,
            required : true,
            default : 0
        },
        cookDurationMins : {
            type : Number,
            required : true
        },
        description :{
            type : String,
            required : false
        }
    }
);

const Food = mongoose.model("Food", FoodSchema);
module.exports = Food;