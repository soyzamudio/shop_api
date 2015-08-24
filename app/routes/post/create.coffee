Post = require '../../models/post/post'

module.exports = (req, res) ->
  Post.create req.body, (err, post) ->
    if err or not post then res.status 500
    res.send post: post
