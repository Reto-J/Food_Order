const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const OrderSchema = mongoose.Schema(
    {
        foodIds : {
            type : String,
            requiired: true
        },
        restaurantId : {
            type : String,
            required : true
        },
        userId: {
            type : String,
            required : true
        },
        isAccepted: {
            type : Boolean,
            required : true
        },
        cleared: {
            type: Boolean,
            required: true,
            default: false
        }
    },
    {
        timestamps : true
    }
);

const Order =  mongoose.model("User" , OrderSchema);
module.exports = Order; 
