var gulp = require('gulp'); // все данные из модуля node->gulp в переменную; 
var sass = require('gulp-sass'); // инициализация обработчика gulp->sass
var uglify = require('gulp-uglify');
var cssnano = require("gulp-cssnano"); // Минимизация CSS
var rename = require("gulp-rename");
// var browserSync = require('browser-sync');

// npm install gulp-sass --save-dev установка gulp
// npm install browser-sync --save-dev установка авторелоад;
// npm install --save-dev gulp gulp-uglify
// npm install --save-dev gulp browserify

gulp.task('sass', function() {
	return gulp.src('app/sass/*.sass')
		.pipe(sass())
		.pipe(cssnano())
        .pipe(rename({ suffix: '.min' }))
		.pipe(gulp.dest('./dist/css'))
});

gulp.task('js', function() {
  return gulp.src('app/js/common.js')
    .pipe(uglify())
    .pipe(gulp.dest('./dist/js'))
});

gulp.task('watch', function(){
	gulp.watch('app/sass/iheaven.sass', gulp.series('sass'));
	gulp.watch('app/js/common.js', gulp.series('js'));
})

  // другие ресурсы
// gulp.task('watch', ['browserSync', 'sass'], function(){
// 	gulp.watch('app/sass/chaspick.sass', ['sass'])
// })