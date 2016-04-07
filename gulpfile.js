// REQUIRES //
var gulp = require('gulp');
// TASKS //
var sasstask = require('./gulps/sasstask');
var htmltask = require('./gulps/htmltask');
var config = require('./gulps/config');


gulp.task('watcher', () => {
  gulp.watch(config.paths.html.all, ['html']);
  gulp.watch(config.paths.css.all, ['sass']);
});

gulp.task('default', ['html', 'sass', 'watcher']);
