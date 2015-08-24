mongoose = require 'mongoose'

postSchema = new mongoose.Schema
  image:
    type: String
    required: true
  # user:
  #   type: mongoose.Schema.ObjectId
  #   ref: 'User'
  #   required: true
  items: [ String ]
  createdAt:
    type: Date
    default: Date.now

postSchema.statics.create = (payload, cb) ->
  console.log payload
  post = new Post payload
  post.save cb null, post

Post = mongoose.model 'Post', postSchema

module.exports = Post
