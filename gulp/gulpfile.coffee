gulp = require 'gulp'
$ = require('gulp-load-plugins')()

paths =
  coffee: ['./app/**/*.coffee']

gulp.task 'default', ['coffee', 'watch']

gulp.task 'coffee', ->
  gulp.src paths.coffee
  .pipe $.coffee bare: true
  .on 'error', $.util.log
  .pipe gulp.dest './build'

gulp.task 'watch', ->
  gulp.watch paths.coffee, ['coffee']
