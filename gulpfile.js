var gulp = require('gulp');
var jade = require('gulp-jade');
var sass = require('gulp-sass');

gulp.task('sass', () => {
  return gulp.src('sass/**/*sass')
    .pipe(sass())
    .pipe(gulp.dest('styles'));
});

gulp.task('html', () => {
  return gulp.src('jade/**/*jade')
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest('./'));
});

gulp.task('watcher', () => {
  gulp.watch('jade/**/*jade', ['html']);
  gulp.watch('sass/**/*sass', ['sass']);
});

gulp.task('default', ['html', 'sass', 'watcher']);
