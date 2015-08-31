User = require '../../models/user/user'

module.exports = (req, res) ->
  User.findOne username: req.query.username, (err, user) ->
    if err or not user
      res.status(401).send message: 'Wrong email and/or password'
    user.comparePassword req.body.password, (err, isMatch) ->
      if not isMatch
        res.status(401).send message: 'Wrong email and/or password'
      res.send
        user: user
        token: User.createJWT user
