mongoose = require 'mongoose'

userSchema = new mongoose.Schema
  username:
    type: String
    required: true
  password:
    type: String
  twitter:
    type: String
  facebook:
    type: String
  createdAt:
    type: Date
    default: Date.now

userSchema.statics.create = (payload, cb) ->
  console.log payload
  user = new User payload
  user.save cb null, user

module.exports = mongoose.model 'User', userSchema
