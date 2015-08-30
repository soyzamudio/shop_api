mongoose = require 'mongoose'
bcrypt = require 'bcrypt'
moment = require 'moment'
jwt = require 'jwt-simple'

userSchema = new mongoose.Schema
  username:
    type: String
    required: true
  password:
    type: String
  email:
    type: String
    required: true
  twitter:
    type: String
  facebook:
    type: String
  createdAt:
    type: Date
    default: Date.now

userSchema.methods.token = ->
  console.log @
  payload =
    sub: @._id
    iat: moment().unix()
    exp: moment().add(10, 'days').unix()

  jwt.encode payload, process.env.TOKEN_SECRET

userSchema.statics.register = (o, cb) ->
  User.findOne
    email: o.email
  , (err, u) ->
    if u then return cb true
    user = new User o
    user.password = bcrypt.hashSync o.password, 8
    user.save(cb)

userSchema.statics.authenticate = (o, cb) ->
  User.findOne
    email: o.email
  , (err, user) ->
    if not user then return cb true
    isGood = bcrypt.compareSync o.password, user.password
    if not isGood then return cb true
    cb null, user

User = mongoose.model 'User', userSchema
module.exports = User
