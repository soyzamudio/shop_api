User = require '../../models/user/user'

module.exports = (req, res) ->
  console.log req.body
  User.register req.body, (err, user) ->
    if err or not user then res.send 401
    token = user.token()
    user.password = null
    res.send
      token: token
      user: user
