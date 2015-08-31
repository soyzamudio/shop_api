User = require '../../models/user/user'

module.exports = (req, res) ->
  User.findOne username: req.body.username, (err, existingUser) ->
    if existingUser
      return res.status(409).send message: 'Username is already taken'
    user = new User req.body
    user.save ->
      user.password = null
      res.send
        user: user
        token: User.createJWT user
