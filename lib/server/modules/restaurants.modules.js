const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const RestSchema = mongoose.Schema(
    {
        name : {
            type : String,
            requiired: true
        },
        email: {
            type : String,
            unique :true,
            trim: true,
            required: true
        },
        image : {
            type : String,
            required : true
        },
        rating : {
            type : Number,
            required : false,
            default : 0
        },
        password: {
            type : String,
            required: true
        },
        lat : {type: Number},
        long : {type: Number},
        description: {
            type : String,
            required : false
        }
    },
    {
        timestamps : true
    }
);

RestSchema.pre("save", async function () {
  // Only hash if password is new or modified
  if (!this.isModified("password")) return;

  this.password = await bcrypt.hash(this.password, 10);
});

const Restaurant =  mongoose.model("Restaurant" , RestSchema);
module.exports = Restaurant; 
