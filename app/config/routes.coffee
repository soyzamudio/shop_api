module.exports = (app) ->
  # app.get '/user', require './../routes/user/index'
  # app.post '/user', require './../routes/user/create'
  app.get '/post/friends', require './../routes/post/index'
  app.get '/post/world', require './../routes/post/index'
  app.get '/post/curated', require './../routes/post/index'
  app.post '/post', require './../routes/post/create'
