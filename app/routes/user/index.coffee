User = require '../../models/user/user'

module.exports = (req, res) ->
  User.authenticate req.query, (err, user) ->
    if err or not user then res.send 401
    console.log user
    token = user.token()
    user.password = null
    res.send
      token: token
      user: user
