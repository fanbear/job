var gulp = require("gulp");

var sass = require("gulp-sass"), // переводит SASS в CSS
    cssnano = require("gulp-cssnano"), // Минимизация CSS
    autoprefixer = require('gulp-autoprefixer'), // Проставлет вендорные префиксы в CSS для поддержки старых браузеров
    imagemin = require('gulp-imagemin'), // Сжатие изображений
    concat = require("gulp-concat"), // Объединение файлов - конкатенация
    uglify = require("gulp-uglify"), // Минимизация javascript
    rename = require("gulp-rename"), // Переименование файлов
    plumber = require('gulp-plumber'),
	coffee = require('gulp-coffee'),
	browserSync = require('browser-sync'); // Подключаем Browser Sync


	//npm i потом код снизу!
    //npm install --save-dev gulp-install установка gulp
    ///установка плагинов npm i gulp-jshint --save-dev
    //npm i gulp-sass gulp-cssnano gulp-autoprefixer gulp-imagemin gulp-concat gulp-uglify gulp-rename --save-dev

    /* --------------------------------------------------------
  		 ----------------- Таски ---------------------------
	------------------------------------------------------------ */




	// Копирование файлов HTML в папку dist
gulp.task("html", function() {
    return gulp.src("src/*.html")
    .pipe(gulp.dest("dist"))
    .pipe(browserSync.reload({stream: true}));
});

//выдавать в консоль ошибки и продолжать Watch (npm install --save-dev gulp-plumber) Установка
gulp.src('./src/*.ext')
	.pipe(plumber())
	.pipe(coffee())
	.pipe(gulp.dest('./dist'));

// Объединение, компиляция Sass в CSS, простановка венд. префиксов и дальнейшая минимизация кода
// gulp.task("sass", function() {
//     return gulp.src("src/sass/*.sass")
//         .pipe(concat('styles.sass'))
//         .pipe(sass())
//         .pipe(autoprefixer({
//             browsers: ['last 2 versions'],
//             cascade: false
//          }))
//         .pipe(cssnano())
//         .pipe(rename({ suffix: '.min' }))
//         .pipe(gulp.dest("dist/css"))
//         .pipe(browserSync.reload({stream: true})); // Обновляем CSS на странице при изменении
// });

gulp.task("sass", function() {
    return gulp.src("src/sass/*.sass")
        .pipe(concat('styles.sass'))
        .pipe(sass())
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
         }))
        .pipe(cssnano())
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest("../local/lib/static/css"))
        .pipe(browserSync.reload({stream: true})); // Обновляем CSS на странице при изменении
});

// Объединение и сжатие JS-файлов
gulp.task("scripts", function() {
    return gulp.src("src/js/*.js") // директория откуда брать исходники
        .pipe(concat('common.js')) // объеденим все js-файлы в один 
        .pipe(uglify()) // вызов плагина uglify - сжатие кода
        .pipe(rename({ suffix: '.min' })) // вызов плагина rename - переименование файла с приставкой .min
        .pipe(gulp.dest("dist/js")) // директория продакшена, т.е. куда сложить готовый файл
        .pipe(browserSync.reload({stream: true})); // Обновляем CSS на странице при изменении
});

// Сжимаем картинки
gulp.task('imgs', function() {
    return gulp.src("src/img/*.+(jpg|jpeg|png|gif)")
        .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{ removeViewBox: false }],
            interlaced: true
        }))
        .pipe(gulp.dest("dist/img/"))
        .pipe(browserSync.reload({stream: true})); // Обновляем CSS на странице при изменении
});

// Задача слежения за измененными файлами
gulp.task("watch", function() {
    gulp.watch("src/*.html", ["html"], browserSync.reload);
    gulp.watch("src/js/*.js", ["scripts"], browserSync.reload);
    gulp.watch("src/sass/*.sass", ["sass"], browserSync.reload);
    gulp.watch("src/img/*.+(jpg|jpeg|png|gif)", ["imgs"], browserSync.reload);
});

///// Таски ///////////////////////////////////////
    //веб сервере устнановка npm i browser-sync --save-dev


gulp.task('browser-sync', function() { // Создаем таск browser-sync
    browserSync({ // Выполняем browser Sync
        server: { // Определяем параметры сервера
            baseDir: 'dist' // Директория для сервера - app
        },
        notify: false // Отключаем уведомления
    });
});

// Запуск тасков по умолчанию
gulp.task("default", ["html", "sass", "scripts", "imgs","browser-sync", "watch"]);