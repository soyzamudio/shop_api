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

userSchema.pre 'save', (next) ->
  user = @
  if not user.isModified 'password' then return next()
  bcrypt.genSalt 10, (err, salt) ->
    bcrypt.hash user.password, salt, (err, hash) ->
      user.password = hash
      next()

userSchema.statics.createJWT = (user) ->
  payload =
    sub: user._id
    iat: moment().unix()
    exp: moment().add(14, 'days').unix()
  jwt.encode payload, process.env.TOKEN_SECRET

userSchema.methods.comparePassword = (password, done) ->
  isGood = bcrypt.compareSync password, @.password
  if not isGood then return done true
  done null, isGood

User = mongoose.model 'User', userSchema
module.exports = User
