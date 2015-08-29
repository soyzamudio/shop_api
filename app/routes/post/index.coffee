Post = require '../../models/post/post'

module.exports = (req, res) ->
  Post
    .find {}
    .sort
      createdAt: 'desc'
    .exec (err, posts) ->
      if err or not posts then res.send 500
      res.send posts: posts
