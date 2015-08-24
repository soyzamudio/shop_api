module.exports = (app) ->
  # app.get '/user', require './../routes/user/index'
  # app.post '/user', require './../routes/user/create'
  app.get '/post', require './../routes/post/index'
  app.post '/post', require './../routes/post/create'
