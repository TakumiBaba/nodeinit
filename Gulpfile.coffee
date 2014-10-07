gulp = require 'gulp'

plumber = require 'gulp-plumber'
coffee = require 'gulp-coffee'
lint = require 'gulp-coffeelint'
mocha = require 'gulp-mocha'
gutil = require 'gulp-util'

gulp.task 'coffee:compile', ->
  return gulp.src "src/**/*.coffee"
  .pipe plumber()
  .pipe coffee({bare: true}).on 'error', gutil.log
  .pipe gulp.dest 'lib/'

gulp.task 'coffee:lint', ->
  return gulp.src "src/**/*.coffee"
  .pipe plumber()
  .pipe lint()
  .pipe lint.reporter()

gulp.task 'mocha', ->
  return gulp.src "tests/**/*.coffee"
  .pipe plumber()
  .pipe mocha
    ui: 'bdd'
    reporter: 'spec'
    ignoreLeaks: no

gulp.task 'watch', ->
  gulp.watch 'src/**/*.coffee', ['coffee:lint', 'coffee:compile', 'mocha']

gulp.task 'default', ['coffee:lint', 'coffee:compile', 'mocha', 'watch'],  ->
