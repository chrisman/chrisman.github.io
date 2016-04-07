var gulp = require('gulp');
var jade = require('gulp-jade');
var config = require('./config');

module.exports = gulp.task('html', () => {
  return gulp.src(config.paths.html.all)
    .pipe(jade({
      //pretty: true
    }))
    .pipe(gulp.dest(config.paths.html.dest));
});
