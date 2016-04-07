var gulp = require('gulp');
var sass = require('gulp-sass');
var config = require('./config');

module.exports = gulp.task('sass', function(){
  return gulp.src(config.paths.css.all)
    .pipe(sass())
    .pipe(gulp.dest(config.paths.css.dest));
});
